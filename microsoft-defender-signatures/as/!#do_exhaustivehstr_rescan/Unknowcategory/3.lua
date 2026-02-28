local L0_1, L1_1, L2_1, L3_1
L0_1 = peattributes
L0_1 = L0_1.suspicious_timestamp
if not L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.deep_analysis
  if not L0_1 then
    L0_1 = peattributes
    L0_1 = L0_1.dt_error_heur_exit_criteria
    if not L0_1 then
      L0_1 = peattributes
      L0_1 = L0_1.suspicious_image_version
      if not L0_1 then
        L0_1 = mp
        L0_1 = L0_1.CLEAN
        return L0_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "HSTR:TrojanSpy:Win32/Rebhip!custom"
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "HSTR:TrojanSpy:Win32/Rebhip!rsrc"
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "HSTR:TrojanSpy:Win32/Rebhip!exhaustive"
L2_1 = L2_1(L3_1)
if L0_1 or L1_1 or L2_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
