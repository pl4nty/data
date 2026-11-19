-- Threat: !InfrastructureShared
-- Name: 117b3c806b238
-- Type: 21
-- Includes: BMLuaLib

if isTamperProtectionOn(false) then
  local l_0_0 = bm.get_imagepath()
  if l_0_0 then
    mp.ReportLowfi(l_0_0, 1443100823)
  end
  return mp.INFECTED
end
return mp.CLEAN
