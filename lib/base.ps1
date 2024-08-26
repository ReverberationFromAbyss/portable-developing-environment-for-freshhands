
$env:PSModulePath     = $PWD.ToString()+"\lib"
#$HOME                = $PWD.ToString()+"\home"
remove-variable -force HOME
$HOME                 = $PWD.ToString()+"\home"

$env:XDG_HOME_DIR     = $PWD.ToString()+"\home"
$env:XDG_DATA_HOME    = $PWD.ToString()+"\home\.local\share"
$env:XDG_CONFIG_HOME  = $PWD.ToString()+"\home\.config"
$env:XDG_STATE_HOME   = $PWD.ToString()+"\home\.local\state"
$env:HOME             = $PWD.ToString()+"\home"
$PROFILE              = $PWD.ToSTring()+"\home\profile.ps1"



Import-Module -Name libLoad -Verbose

if ((get-item $PWD).Name.Equals("lib")) {
  cd ..
  AddPathAuto $args
  AddEnvAuto $args
}

$_ = AddPathAuto $args
$_ = AddEnvAuto $args
