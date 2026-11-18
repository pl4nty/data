-- Threat: !InfrastructureShared
-- Name: 8fb3ff352b1c
-- Type: 21

if this_sigattrlog[3].matched then
  local l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
  MpCommon.AppendPersistContextNoPath("CreatedAppDataMsi", l_0_0, 10)
end
return mp.CLEAN
