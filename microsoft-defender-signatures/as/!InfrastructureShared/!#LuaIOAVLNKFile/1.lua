-- Threat: !InfrastructureShared
-- Name: !#Lua:IOAVLNKFile
-- Type: 13
-- MpAttributes: RPF:AnyFileHasIOAVURL & BM_LNK_FILE

local l_0_0 = ""
if mp.get_mpattribute("Lua:LNK_Settings!HasArguments") then
  l_0_0 = "Args"
end
if mp.get_mpattribute("Lua:LNK_Settings!RunMinimized") then
  l_0_0 = l_0_0 .. "Min"
end
if mp.get_mpattribute("RPF:TopLevelFile") then
  mp.set_mpattribute("Lua:IOAVTopLevelLNKFile" .. l_0_0)
  mp.set_mpattribute("//Lua:GIOAVTopLevelLNKFile" .. l_0_0)
elseif not mp.get_mpattribute("//Lua:GIOAVFirstLNKFile" .. l_0_0 .. "InContainer") then
  mp.set_mpattribute("Lua:IOAVFirstLNKFile" .. l_0_0 .. "InContainer")
  mp.set_mpattribute("//Lua:GIOAVFirstLNKFile" .. l_0_0 .. "InContainer")
end
return mp.CLEAN
