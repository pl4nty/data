local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "HSTR:TrojanSpy:Win32/Xtrat!rsrc"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.suspicious_timestamp
if L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.dirty_wx_branch
  if L0_1 then
    L0_1 = peattributes
    L0_1 = L0_1.dt_error_heur_exit_criteria
    if L0_1 then
      L0_1 = mp
      L0_1 = L0_1.INFECTED
      return L0_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
