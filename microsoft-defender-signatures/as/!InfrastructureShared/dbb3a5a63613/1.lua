local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if L0_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  L3_1 = "\\windows\\system32\\services.exe"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    goto lbl_31
  end
end
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
if L1_1 then
  L2_1 = L1_1.integrity_level
  L3_1 = MpCommon
  L3_1 = L3_1.SECURITY_MANDATORY_SYSTEM_RID
  if L2_1 >= L3_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
::lbl_31::
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.utf8p2
if L1_1 and L1_1 ~= "" then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "\\programdata\\microsoft\\windows defender\\definition updates\\{%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x}\\mpksldrv%.sys"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "%%common_appdata%%\\microsoft\\windows defender\\definition updates\\{%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x}\\mpksldrv%.sys"
    L2_1 = L2_1(L3_1, L4_1)
    if not L2_1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "\\windows\\system32\\mpenginestore\\mpksldrv.sys"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        L2_1 = mp
        L2_1 = L2_1.INFECTED
        return L2_1
      end
    end
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.utf8p1
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "\\(mpksl[%w]+)"
L3_1 = L3_1(L4_1, L5_1)
L2_1 = L3_1
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = getService
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
