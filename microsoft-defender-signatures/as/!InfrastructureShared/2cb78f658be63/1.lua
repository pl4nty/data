-- Threat: !InfrastructureShared
-- Name: 2cb78f658be63
-- Type: 21

if peattributes.ismsil then
  local l_0_0 = string.lower(mp.getfilename())
  if not l_0_0.find(l_0_0, "avira.pwm.nativemessaging.exe") then
    return mp.INFECTED
  end
end
return mp.CLEAN
