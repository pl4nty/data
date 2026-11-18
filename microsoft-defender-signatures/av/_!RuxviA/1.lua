-- Threat: \x88!Ruxvi.A
-- Type: 10
-- MpAttributes: HSTR:TrojanDownloader:Win32/Ruxvi.A & MpHasExpensiveLoop

if not peattributes.dt_error_heur_exit_criteria then
  return mp.CLEAN
end
return mp.INFECTED
