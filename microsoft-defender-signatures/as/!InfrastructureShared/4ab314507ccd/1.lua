-- Threat: !InfrastructureShared
-- Name: 4ab314507ccd
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = {
  "anydesk",
  "SoftyPlanning",
  "OverSolutionHelpDesk.exe",
  "qwepesk.exe",
  "soporte remoto",
  "\\synaptics.exe",
  "implemo_dostep_zdalny.exe",
  "cgm_remote_support.exe"
}
if contains(bm.get_imagepath(), l_0_0) then
  return mp.CLEAN
end
reportSessionInformation()
return mp.INFECTED
