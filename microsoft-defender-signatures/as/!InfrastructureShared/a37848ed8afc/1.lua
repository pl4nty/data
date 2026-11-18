-- Threat: !InfrastructureShared
-- Name: a37848ed8afc
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isdll == true and l_0_0 <= 150000 and mp.get_mpattribute("Sigattr:Win32/ShellcodeRunner.AL!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
