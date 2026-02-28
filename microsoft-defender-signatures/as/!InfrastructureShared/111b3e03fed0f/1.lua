local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L0_1 = L1_1.utf8p2
end
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "-ap \""
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    L2_1 = L1_1
    L1_1 = L1_1.match
    L3_1 = "-ap \"([^\"]+)\""
    L1_1 = L1_1(L2_1, L3_1)
    L0_1 = L1_1
end
else
  L1_1 = bm
  L1_1 = L1_1.get_current_process_startup_info
  L1_1 = L1_1()
  if L1_1 ~= nil then
    L2_1 = L1_1.command_line
    if L2_1 ~= nil then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = L1_1.command_line
      L2_1 = L2_1(L3_1)
      L3_1 = L2_1
      L2_1 = L2_1.match
      L4_1 = "-ap \"([^\"]+)\""
      L2_1 = L2_1(L3_1, L4_1)
      L0_1 = L2_1
    end
  end
end
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = ExtractDeviceProperties
L2_1 = L2_1()
L3_1 = L2_1.DeviceRoles
if L3_1 then
  L3_1 = L2_1.DeviceRoles
  L3_1 = L3_1.SharePointServer
  if L3_1 ~= nil then
    goto lbl_64
  end
end
L3_1 = IsSharepointServer
L3_1 = L3_1()
::lbl_64::
if L3_1 then
  L3_1 = "C:\\Program Files\\Common Files\\microsoft shared\\Web Server Extensions\\15\\TEMPLATE\\LAYOUTS"
  L4_1 = "C:\\Program Files\\Common Files\\microsoft shared\\Web Server Extensions\\16\\TEMPLATE\\LAYOUTS"
  L5_1 = sysio
  L5_1 = L5_1.IsFolderExists
  L6_1 = L3_1
  L5_1 = L5_1(L6_1)
  if L5_1 then
    L1_1 = L3_1
  else
    L5_1 = sysio
    L5_1 = L5_1.IsFolderExists
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    if L5_1 then
      L1_1 = L4_1
    end
  end
  if L1_1 == nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = mp
  L5_1 = L5_1.TriggerScanResource
  L6_1 = "folder"
  L7_1 = L1_1
  L5_1(L6_1, L7_1)
  L5_1 = sysio
  L5_1 = L5_1.FindFiles
  L6_1 = L1_1
  L7_1 = "*.aspx"
  L8_1 = 0
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  L6_1 = pairs
  L7_1 = L5_1
  L6_1, L7_1, L8_1 = L6_1(L7_1)
  for L9_1, L10_1 in L6_1, L7_1, L8_1 do
    L11_1 = mp
    L11_1 = L11_1.ReportLowfi
    L12_1 = L10_1
    L13_1 = 2037457591
    L11_1(L12_1, L13_1)
  end
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L3_1 = MpCommon
L3_1 = L3_1.ExpandEnvironmentVariables
L4_1 = "%windir%\\system32\\inetsrv\\config\\applicationHost.config"
L3_1 = L3_1(L4_1)
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = MpCommon
L4_1 = L4_1.GetIisInstallPaths
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 == nil or L4_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = false
L6_1 = false
L7_1 = "["
L8_1 = ""

function L9_1(...)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = {}
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = ...
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L3_2[4] = L7_2
  L3_2[5] = L8_2
  L3_2[6] = L9_2
  L3_2[7] = L10_2
  L3_2[8] = L11_2
  L3_2[9] = L12_2
  L3_2[10] = L13_2
  L3_2[11] = L14_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = ipairs
    L8_2 = L6_2
    L7_2, L8_2, L9_2 = L7_2(L8_2)
    for L10_2, L11_2 in L7_2, L8_2, L9_2 do
      L12_2 = table
      L12_2 = L12_2.insert
      L13_2 = L1_2
      L14_2 = L11_2
      L12_2(L13_2, L14_2)
    end
  end
  return L1_2
end

merge_tables = L9_1
L9_1 = ipairs
L10_1 = L4_1
L9_1, L10_1, L11_1 = L9_1(L10_1)
for L12_1, L13_1 in L9_1, L10_1, L11_1 do
  L14_1 = L13_1.PoolName
  if L14_1 ~= nil then
    L14_1 = L13_1.PoolName
    if L14_1 ~= "" then
      L14_1 = L13_1.Path
      if L14_1 ~= nil then
        L14_1 = L13_1.Path
        if L14_1 ~= "" then
          L14_1 = string
          L14_1 = L14_1.lower
          L15_1 = L13_1.PoolName
          L14_1 = L14_1(L15_1)
          if L14_1 == L0_1 then
            L14_1 = L7_1
            L15_1 = L13_1.Path
            L16_1 = "|"
            L7_1 = L14_1 .. L15_1 .. L16_1
            L14_1 = mp
            L14_1 = L14_1.TriggerScanResource
            L15_1 = "folder"
            L16_1 = L13_1.Path
            L14_1(L15_1, L16_1)
            L14_1 = sysio
            L14_1 = L14_1.FindFiles
            L15_1 = L13_1.Path
            L16_1 = "*.aspx"
            L17_1 = -1
            L14_1 = L14_1(L15_1, L16_1, L17_1)
            L15_1 = sysio
            L15_1 = L15_1.FindFiles
            L16_1 = L13_1.Path
            L17_1 = "*.asp"
            L18_1 = -1
            L15_1 = L15_1(L16_1, L17_1, L18_1)
            L16_1 = sysio
            L16_1 = L16_1.FindFiles
            L17_1 = L13_1.Path
            L18_1 = "*.ashx"
            L19_1 = -1
            L16_1 = L16_1(L17_1, L18_1, L19_1)
            L17_1 = sysio
            L17_1 = L17_1.FindFiles
            L18_1 = L13_1.Path
            L19_1 = "*.jsp"
            L20_1 = -1
            L17_1 = L17_1(L18_1, L19_1, L20_1)
            L18_1 = sysio
            L18_1 = L18_1.FindFiles
            L19_1 = L13_1.Path
            L20_1 = "*.php"
            L21_1 = -1
            L18_1 = L18_1(L19_1, L20_1, L21_1)
            L19_1 = L13_1.Path
            L20_1 = "\\web.config"
            L19_1 = L19_1 .. L20_1
            L20_1 = sysio
            L20_1 = L20_1.IsFileExists
            L21_1 = L19_1
            L20_1 = L20_1(L21_1)
            if L20_1 then
              L20_1 = L8_1
              L21_1 = L19_1
              L22_1 = "|"
              L8_1 = L20_1 .. L21_1 .. L22_1
              L6_1 = true
            end
            L20_1 = merge_tables
            L21_1 = L14_1
            L22_1 = L15_1
            L23_1 = L16_1
            L24_1 = L17_1
            L25_1 = L18_1
            L20_1 = L20_1(L21_1, L22_1, L23_1, L24_1, L25_1)
            if L20_1 then
              L5_1 = true
              L21_1 = pairs
              L22_1 = L20_1
              L21_1, L22_1, L23_1 = L21_1(L22_1)
              for L24_1, L25_1 in L21_1, L22_1, L23_1 do
                L26_1 = string
                L26_1 = L26_1.find
                L27_1 = L25_1
                L28_1 = "\\owa\\auth\\errorFE.aspx"
                L29_1 = 1
                L30_1 = true
                L26_1 = L26_1(L27_1, L28_1, L29_1, L30_1)
                if L26_1 == nil then
                  L26_1 = string
                  L26_1 = L26_1.find
                  L27_1 = L25_1
                  L28_1 = "\\ecp\\auth\\TimeoutLogout.aspx"
                  L29_1 = 1
                  L30_1 = true
                  L26_1 = L26_1(L27_1, L28_1, L29_1, L30_1)
                  if L26_1 == nil then
                    L26_1 = mp
                    L26_1 = L26_1.ReportLowfi
                    L27_1 = L25_1
                    L28_1 = 2037457591
                    L26_1(L27_1, L28_1)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
if L6_1 then
  L9_1 = bm
  L9_1 = L9_1.trigger_sig
  L10_1 = "webconfig_paths"
  L11_1 = L8_1
  L9_1(L10_1, L11_1)
end
if L5_1 then
  L9_1 = L7_1
  L10_1 = "]"
  L7_1 = L9_1 .. L10_1
  L9_1 = bm
  L9_1 = L9_1.add_related_string
  L10_1 = "webshellpaths"
  L11_1 = L7_1
  L12_1 = bm
  L12_1 = L12_1.RelatedStringBMReport
  L9_1(L10_1, L11_1, L12_1)
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
