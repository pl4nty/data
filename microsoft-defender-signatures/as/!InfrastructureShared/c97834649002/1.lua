-- Threat: !InfrastructureShared
-- Name: c97834649002
-- Type: 21

if mp.getfilesize() < 290000 then
  pe.set_peattribute("deep_analysis", true)
  pe.reemulate()
  return mp.INFECTED
end
return mp.CLEAN
