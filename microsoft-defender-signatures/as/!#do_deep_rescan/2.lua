-- Threat: !#do_deep_rescan
-- Type: 10
-- MpAttributes: HSTR:Tesch_Image_Rsrc

if not peattributes.dt_error_heur_exit_criteria then
  return mp.CLEAN
end
return mp.INFECTED
