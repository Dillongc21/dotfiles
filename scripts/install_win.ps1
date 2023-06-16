Write-Host "Welcome to Dillon's Windows system preference startup script`n"

if (!(Get-Command choco -errorAction SilentlyContinue)) {

	$prime_exec_policy = Get-ExecutionPolicy

	Write-Host "Chocolaty is not yet installed"
	Write-Host "Changing execution policy to Bypass, temporarily:"
	Set-ExecutionPolicy Bypass -Scope Process -Force
	Write-Host "Exectution Policy(Process): $(Get-ExecutionPolicy)"

	Write-Host "Installing Chocolaty now..."
	[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
	iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

	Write-Host "Changing execution policy back to $prime_exec_policy"
	Set-ExecutionPolicy  $prime_exec_policy -Scope Process -Force
	Write-Host "Exectution Policy(Process): $(Get-ExecutionPolicy)"
}
else {
	Write-Host "Chocolatey is already installed. Skipping..."
}

Write-Host ""

if (!(Get-Command git -errorAction SilentlyContinue)) {

	Write-Host "Git is not yet installed"
	Write-Host "Installing Git now..."
	choco install git
}
else {
	Write-Host "Git is already installed. Skipping..."
}

Write-Host ""

if (!(Get-Command nvim -errorAction SilentlyContinue)) {

	Write-Host "Neovim is not yet installed"
	Write-Host "Installing Neovim now..."
	choco install neovim
}
else {
	Write-Host "Neovim is already installed. Skipping..."
}
