-- Threat: !InfrastructureShared
-- Name: 7e780167337d
-- Type: 21

if mp.getfilesize() < 273152 and mp.getfilesize() > 112640 and peattributes.isdll and peattributes.hasexports then
  if peattributes.dt_error_heur_exit_criteria then
    pe.set_peattribute("deep_analysis", true)
  end
  pe.reemulate()
end
return mp.INFECTED
