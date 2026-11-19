-- Threat: !InfrastructureShared
-- Name: 6229925e5834
-- Type: 21

if mp.get_mpattribute("Nscript:Type_js") then
  return mp.INFECTED
end
return mp.CLEAN
