local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L0_1 = L0_1(L1_1)
  if L0_1 == true then
    L0_1 = mp
    L0_1 = L0_1.getfilename
    L1_1 = mp
    L1_1 = L1_1.bitor
    L2_1 = mp
    L2_1 = L2_1.bitor
    L3_1 = mp
    L3_1 = L3_1.FILEPATH_QUERY_FNAME
    L4_1 = mp
    L4_1 = L4_1.FILEPATH_QUERY_PATH
    L2_1 = L2_1(L3_1, L4_1)
    L3_1 = mp
    L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
    L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L1_1(L2_1, L3_1)
    L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
    if L0_1 ~= nil then
      L3_1 = L0_1
      L2_1 = L0_1.len
      L2_1 = L2_1(L3_1)
      if 12 < L2_1 and L1_1 ~= nil then
        L2_1 = false
        L3_1 = ""
        L5_1 = L0_1
        L4_1 = L0_1.sub
        L6_1 = -8
        L4_1 = L4_1(L5_1, L6_1)
        if L4_1 == "\\desktop" then
          L2_1 = true
          L3_1 = "Lua:WrittenToDesktopFolder"
          L4_1 = mp
          L4_1 = L4_1.set_mpattribute
          L5_1 = L3_1
          L4_1(L5_1)
        else
          L5_1 = L0_1
          L4_1 = L0_1.find
          L6_1 = "\\desktop\\"
          L7_1 = 1
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if L4_1 ~= nil then
            L2_1 = true
            L3_1 = "Lua:WrittenToDesktopSubfolder"
            L4_1 = mp
            L4_1 = L4_1.set_mpattribute
            L5_1 = L3_1
            L4_1(L5_1)
          end
        end
        if L2_1 == true then
          L5_1 = L1_1
          L4_1 = L1_1.len
          L4_1 = L4_1(L5_1)
          if 64 < L4_1 then
            L4_1 = mp
            L4_1 = L4_1.set_mpattribute
            L5_1 = "Lua:WrittenToDesktopFolderWithLongFileName"
            L4_1(L5_1)
          end
          L4_1 = mp
          L4_1 = L4_1.get_contextdata
          L5_1 = mp
          L5_1 = L5_1.CONTEXT_DATA_PROCESSNAME
          L4_1 = L4_1(L5_1)
          if not L4_1 then
            L4_1 = ""
          end
          if L4_1 == "" then
            L5_1 = L3_1
            L6_1 = "ByUnknownParentProcess"
            L3_1 = L5_1 .. L6_1
          else
            L5_1 = {}
            L5_1["searchprotocolhost.exe"] = "WindowsBinary"
            L5_1["explorer.exe"] = "Explorer"
            L5_1["svchost.exe"] = "WindowsBinary"
            L5_1["dllhost.exe"] = "WindowsBinary"
            L5_1["7zg.exe"] = "Archiver"
            L5_1["winzip64.exe"] = "Archiver"
            L5_1["winrar.exe"] = "Archiver"
            L5_1["chrome.exe"] = "Browser"
            L5_1["opera.exe"] = "Browser"
            L5_1["brave.exe"] = "Browser"
            L5_1["bittorrent.exe"] = "Torrent"
            L5_1["utorrent.exe"] = "Torrent"
            L7_1 = L4_1
            L6_1 = L4_1.lower
            L6_1 = L6_1(L7_1)
            L6_1 = L5_1[L6_1]
            if nil == L6_1 then
              L7_1 = L3_1
              L8_1 = "ByOtherParentProcess"
              L3_1 = L7_1 .. L8_1
            else
              L7_1 = L3_1
              L8_1 = "By"
              L9_1 = L6_1
              L3_1 = L7_1 .. L8_1 .. L9_1
            end
          end
          L5_1 = mp
          L5_1 = L5_1.set_mpattribute
          L6_1 = L3_1
          L5_1(L6_1)
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
