-- Threat: !InfrastructureShared
-- Name: 38d061c03a18
-- Type: 21

if mp.readu_u16(headerpage, 1) ~= 23117 then
  return mp.INFECTED
end
return mp.CLEAN
