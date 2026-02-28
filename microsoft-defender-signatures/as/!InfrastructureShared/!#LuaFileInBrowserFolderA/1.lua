local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
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
    L1_1 = {}
    L1_1["Lua:FileInMicrosoftEdgeCache.A"] = "\\users\\[^\\]+\\appdata\\local\\packages\\microsoft.microsoftedge_8wekyb3d8bbwe\\.+\\#!.+\\microsoftedge\\cache\\.+"
    L1_1["Lua:FileInMicrosoftEdgeDownloadsFolder.A"] = "\\users\\[^\\]+\\appdata\\local\\packages\\microsoft.microsoftedge_8wekyb3d8bbwe\\tempstate\\downloads.*"
    L1_1["Lua:FileInInternetExplorerTemp.A"] = "\\users\\[^\\]+\\appdata\\local\\microsoft\\windows\\temporary internet files\\content.ie5\\.+"
    L1_1["Lua:FileInChromeCache.A"] = "\\users\\[^\\]+\\appdata\\local\\google\\chrome\\user data\\default\\cache\\.+"
    L1_1["Lua:FileInOperaCache.A"] = "\\users\\[^\\]+\\appdata\\local\\opera software\\opera stable\\cache\\.+"
    L1_1["Lua:FileInFilefoxCache.A"] = "\\users\\[^\\]+\\appdata\\local\\mozilla\\firefox\\profiles\\.+%.default\\cache2\\entries\\.+"
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = L0_1
    L2_1 = L2_1(L3_1)
    L3_1 = pairs
    L4_1 = L1_1
    L3_1, L4_1, L5_1 = L3_1(L4_1)
    for L6_1, L7_1 in L3_1, L4_1, L5_1 do
      L8_1 = string
      L8_1 = L8_1.match
      L9_1 = L2_1
      L10_1 = L7_1
      L8_1 = L8_1(L9_1, L10_1)
      if L8_1 then
        L8_1 = mp
        L8_1 = L8_1.set_mpattribute
        L9_1 = L6_1
        L8_1(L9_1)
        L8_1 = mp
        L8_1 = L8_1.INFECTED
        return L8_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
