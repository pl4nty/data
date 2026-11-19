-- Threat: !InfrastructureShared
-- Name: 13bb3411667f8
-- Type: 21
-- Includes: BMLuaLib

if isTamperProtectionOn() then
  local l_0_0 = bm.get_imagepath()
  if l_0_0 then
    mp.ReportLowfi(l_0_0, 1443100823)
  end
  return mp.INFECTED
end
return mp.CLEAN
