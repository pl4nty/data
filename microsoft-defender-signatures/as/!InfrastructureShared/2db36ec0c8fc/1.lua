-- Threat: !InfrastructureShared
-- Name: 2db36ec0c8fc
-- Type: 21

if not this_sigattrlog[1].matched and this_sigattrlog[2].matched then
  return mp.INFECTED
end
return mp.CLEAN
