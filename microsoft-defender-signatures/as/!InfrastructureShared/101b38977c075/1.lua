-- Threat: !InfrastructureShared
-- Name: 101b38977c075
-- Type: 21
-- Includes: BMLuaLib

if IsExchangeServer() then
  return mp.INFECTED
end
return mp.CLEAN
