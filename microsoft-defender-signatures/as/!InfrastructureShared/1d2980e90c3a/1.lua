-- Threat: !InfrastructureShared
-- Name: 1d2980e90c3a
-- Type: 21

if mp.readu_u32(headerpage, 1) ~= 1953651835 then
  return mp.CLEAN
end
mp.set_mpattribute("MpIsExhaustiveScriptScan")
return mp.INFECTED
