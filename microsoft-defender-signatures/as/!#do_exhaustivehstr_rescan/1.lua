-- Threat: !#do_exhaustivehstr_rescan
-- Type: 10
-- MpAttributes: HSTR:VBInject_CO_Decryption

if not peattributes.dt_error_heur_exit_criteria then
  return mp.CLEAN
end
return mp.INFECTED
