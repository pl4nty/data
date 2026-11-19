-- Threat: !InfrastructureShared
-- Name: !#Lua:RollingQueueSetMpAttributes.A
-- Type: 12
-- Includes: LuaFuncHelper, Path
-- MpAttributes: RPF:TopLevelFile & (Lua:EXEExt | Lua:SCRExt | Lua:PIFExt | Lua:JSExt | Lua:VBSExt | Lua:WSFExt | Lua:WSHExt | Lua:BATExt | Lua:CMDExt)

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or #l_0_0 <= 4 then
  return mp.CLEAN
end
local l_0_1 = normalize_path(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if IsKeyInRollingQueue("UrlFileInStartupTargetA", l_0_1, true) then
  mp.set_mpattribute("Lua:UrlFileInStartupTarget.A")
end
return mp.CLEAN
