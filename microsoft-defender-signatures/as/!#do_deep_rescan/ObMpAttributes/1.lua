local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.dt_error_heur_exit_criteria
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
