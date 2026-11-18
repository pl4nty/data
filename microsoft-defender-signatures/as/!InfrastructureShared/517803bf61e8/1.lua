-- Threat: !InfrastructureShared
-- Name: 517803bf61e8
-- Type: 21

if mp.shr32(pehdr.TimeDateStamp, 22) and mp.shl32(pehdr.TimeDateStamp, 22) == 0 then
  mp.changedetectionname(805306369)
end
return mp.INFECTED
