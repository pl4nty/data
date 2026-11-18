-- Threat: !InfrastructureShared
-- Name: 3c299c52faa2
-- Type: 21

if mp.readu_u32(headerpage, 1) ~= 1953651835 then
  return mp.CLEAN
end
return mp.INFECTED
