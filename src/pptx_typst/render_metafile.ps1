param(
  [Parameter(Mandatory = $true)][string]$Source,
  [Parameter(Mandatory = $true)][string]$Output,
  [int]$Dpi = 300,
  [int]$MaxEdge = 4096
)
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing
$meta = $null
$bitmap = $null
$graphics = $null
try {
  $meta = [System.Drawing.Imaging.Metafile]::new((Resolve-Path $Source).Path)
  $unit = [System.Drawing.GraphicsUnit]::Point
  $bounds = $meta.GetBounds([ref]$unit)
  if ($bounds.Width -le 0 -or $bounds.Height -le 0) {
    throw 'The metafile has empty bounds.'
  }
  $scale = [Math]::Min($Dpi / 72.0, $MaxEdge / [Math]::Max($bounds.Width, $bounds.Height))
  $width = [Math]::Max(1, [int][Math]::Ceiling($bounds.Width * $scale))
  $height = [Math]::Max(1, [int][Math]::Ceiling($bounds.Height * $scale))
  $bitmap = [System.Drawing.Bitmap]::new(
    $width, $height, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb
  )
  $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
  $graphics.Clear([System.Drawing.Color]::Transparent)
  $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
  $graphics.CompositingMode = [System.Drawing.Drawing2D.CompositingMode]::SourceOver
  $graphics.DrawImage($meta, 0, 0, $width, $height)
  $bitmap.Save($Output, [System.Drawing.Imaging.ImageFormat]::Png)
  Write-Output "$width x $height px at up to $Dpi dpi; edge cap $MaxEdge px"
} catch {
  [Console]::Error.WriteLine($_.ToString())
  exit 1
} finally {
  if ($graphics) { $graphics.Dispose() }
  if ($bitmap) { $bitmap.Dispose() }
  if ($meta) { $meta.Dispose() }
}
