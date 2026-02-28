local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_FILEPATH
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L2_1 = L0_1
  L1_1 = L0_1.len
  L1_1 = L1_1(L2_1)
  if 60 < L1_1 then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    L2_1 = string
    L2_1 = L2_1.match
    L3_1 = L1_1
    L4_1 = "\\users\\[^\\]+\\appdata\\local\\microsoft\\windows\\inetcache\\ie\\.+"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "Lua:Context/FileInINetCacheIE.A"
      L2_1(L3_1)
    end
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "\\appdata\\local\\microsoft\\windows\\inetcache\\content.outlook\\"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 ~= nil then
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "Lua:FileInOutlookCache.A"
      L2_1(L3_1)
    end
    L2_1 = string
    L2_1 = L2_1.match
    L3_1 = L1_1
    L4_1 = "\\users\\[^\\]+\\appdata\\local\\microsoft\\windows\\inetcache\\low\\ie\\.+"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "Lua:Context/FileInINetCacheLowIE.A"
      L2_1(L3_1)
    end
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "\\appdata\\local\\packages\\microsoft.windowscommunicationsapps_8wekyb3d8bbwe\\localstate\\files\\"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 ~= nil then
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "Lua:FileInWindowsMailApp.A"
      L2_1(L3_1)
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
