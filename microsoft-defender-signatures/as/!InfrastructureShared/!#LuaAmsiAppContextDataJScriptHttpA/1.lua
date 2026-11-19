-- Threat: !InfrastructureShared
-- Name: !#Lua:AmsiAppContextDataJScriptHttp.A
-- Type: 13
-- MpAttributes: Lua:AmsiAppContextData:Proc:JScript

if not mp.get_mpattributesubstring("Lua:AmsiAppContextData:File:http") then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 then
  l_0_0 = l_0_0:match("([^\\]+)$")
  if l_0_0 then
    l_0_0 = string.lower(l_0_0:gsub("%s", "/x20"))
    mp.set_mpattribute("Lua:AmsiAppContextDataJScriptHttp:Proc:" .. l_0_0)
  end
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_1 then
  local l_0_2 = mp.GetParentProcInfo(l_0_1)
  if l_0_2 then
    local l_0_3 = l_0_2.image_path
    l_0_3 = l_0_3:match("([^\\]+)$")
    if l_0_3 then
      l_0_3 = string.lower(l_0_3:gsub("%s", "/x20"))
      mp.set_mpattribute("Lua:AmsiAppContextDataJScriptHttp:Parent:" .. l_0_3)
    end
  end
end
local l_0_4 = mp.enum_mpattributesubstring("Lua:AmsiAppContextData:File:http")
if l_0_4 ~= nil and #l_0_4 ~= 0 then
  local l_0_5 = l_0_4[1]:match("https?://[%w%.%-]+%.([%w%.]+)/") or ""
  if l_0_5 ~= "" then
    mp.set_mpattribute("Lua:AmsiAppContextDataHttp:TLD:" .. string.lower(l_0_5))
    local l_0_6 = l_0_4[1]:match("%.([%w]+)$") or ""
    if l_0_6 ~= "" then
      mp.set_mpattribute("Lua:AmsiAppContextDataHttp:FileExt:" .. string.lower(l_0_6))
    end
  end
  if l_0_0 == "mshta.exe" then
    for l_0_7, l_0_8 in ipairs(l_0_4) do
      if not string.find(l_0_8, "%.hta$") and not string.find(l_0_8, "%.html$") then
        mp.set_mpattribute("Lua:AmsiAppContextDataJScriptHttpNonHTA")
        break
      end
    end
  end
end
return mp.INFECTED
