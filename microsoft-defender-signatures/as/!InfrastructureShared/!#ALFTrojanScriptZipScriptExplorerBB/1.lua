-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Script/ZipScriptExplorer.BB
-- Type: 13
-- MpAttributes: Lua:VBSExt | Lua:JSExt | Lua:VBExt

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 then
  local l_0_1 = MpCommon.PathToWin32Path(l_0_0)
  local l_0_2 = "%.zip%.[0-9a-zA-Z]+\\[a-zA-Z0-9]+%.vbs$"
  local l_0_3 = "%.zip%.[0-9a-zA-Z]+\\[a-zA-Z0-9]+%.vbe$"
  local l_0_4 = "%.zip%.[0-9a-zA-Z]+\\[a-zA-Z0-9]+%.js$"
  local l_0_5 = "%.zip%.[0-9a-zA-Z]+\\[a-zA-Z0-9]+%.jse$"
  if (l_0_1:match(l_0_2) or l_0_1:match(l_0_3) or l_0_1:match(l_0_4) or l_0_1:match(l_0_5)) and string.find(l_0_1, "\\appdata\\local\\temp\\", 1, true) then
    local l_0_6 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
    if l_0_6 ~= nil then
      local l_0_7 = string.lower(l_0_6)
      local l_0_8 = l_0_7:match("[^\\]+$")
      if l_0_8 == nil then
        return mp.CLEAN
      end
      local l_0_9 = {
        ["explorer.exe"] = ""
      }
      if l_0_9[l_0_8] then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
