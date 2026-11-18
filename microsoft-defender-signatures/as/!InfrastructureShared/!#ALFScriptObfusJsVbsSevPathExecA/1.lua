-- Threat: !InfrastructureShared
-- Name: !#ALF:Script/ObfusJsVbsSevPathExec.A
-- Type: 13
-- MpAttributes: IsSeville & Lua:JsObfus.D & Lua:JsObfusPathInclusion.A

local l_0_0 = mp.getfilesize()
if l_0_0 <= 300 or 500000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
if l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
if l_0_1:find("\\appdata\\local\\temp\\", 1, true) then
  local l_0_3 = string.match(l_0_1, "\\appdata\\local\\temp\\(.+)")
  if l_0_3:find("\\", 1, true) then
    return mp.CLEAN
  end
  local l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME):lower()
  if l_0_4 ~= nil then
    local l_0_5 = l_0_4:match("[^\\]+$")
    local l_0_6 = {
      ["wscript.exe"] = "",
      ["cscript.exe"] = ""
    }
    if l_0_5 ~= nil and l_0_6[l_0_5] then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
