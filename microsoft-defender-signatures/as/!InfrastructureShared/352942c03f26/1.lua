-- Threat: !InfrastructureShared
-- Name: 352942c03f26
-- Type: 21

if mp.get_mpattribute("//Html_file") then
  return mp.INFECTED
end
return mp.CLEAN
