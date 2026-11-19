-- Threat: !InfrastructureShared
-- Name: 2778e4376ba1
-- Type: 21

if pehdr.Machine == 34404 then
  pe.set_peattribute("deep_analysis", true)
  pe.reemulate()
  return mp.INFECTED
end
return mp.CLEAN
