-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaWSPhpExtract\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 < 24 or l_0_0 > 8388608 then
  return mp.CLEAN
end
local l_0_1 = 196608
local l_0_2 = 65536
local l_0_3 = l_0_0
local l_0_4 = 0
if l_0_1 + l_0_2 < l_0_0 then
  l_0_3 = l_0_1
  l_0_4 = l_0_2
end
;
(mp.readprotection)(false)
local l_0_5 = ((mp.readfile)(0, l_0_3))
local l_0_6 = nil
if l_0_4 > 0 then
  l_0_6 = (mp.readfile)(l_0_0 - l_0_4, l_0_4)
end
;
(mp.readprotection)(true)
if l_0_5 == nil then
  return mp.CLEAN
end
local l_0_7 = {}
local l_0_8 = false
local l_0_9 = false
;
(function(l_1_0, l_1_1)
  -- function num : 0_0 , upvalues : l_0_8, l_0_7, l_0_9
  local l_1_2 = (string.lower)(l_1_0)
  if not WsPhpPrefilter(l_1_2) then
    return 
  end
  l_0_8 = true
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R3 in 'UnsetPending'

  if WsPhpFamilyMarker(l_1_2) then
    l_0_7["Known.FamilyMarker"] = true
  end
  local l_1_3, l_1_4 = pcall(WsPhpExtract, l_1_0, l_1_1)
  if not l_1_3 or type(l_1_4) ~= "table" then
    l_0_9 = true
    return 
  end
  for l_1_8 in pairs(l_1_4) do
    -- DECOMPILER ERROR at PC39: Confused about usage of register: R9 in 'UnsetPending'

    l_0_7[l_1_8] = true
  end
end
)(tostring(l_0_5), false)
if l_0_6 ~= nil then
  local l_0_11 = nil
  local l_0_12 = nil
  if (string.find)(tostring(l_0_6), "\n", 1, true) then
    l_0_12 = (string.sub)(l_0_12, (string.find)(tostring(l_0_6), "\n", 1, true) + 1)
  end
  l_0_11(l_0_12, true)
end
do
  if not l_0_8 then
    return mp.CLEAN
  end
  ;
  (mp.set_mpattribute)("Lua:WS.Php.Analyzed")
  if l_0_9 then
    (mp.set_mpattribute)("Lua:WS.Php.Error")
  end
  local l_0_13 = nil
  for l_0_17 = 1, #{"Lua:WS.Php.Src.Request", "Lua:WS.Php.Src.ServerAlias", "Lua:WS.Php.Src.ServerDynKey", "Lua:WS.Php.Gate.CustomHeader", "Lua:WS.Php.Sink.Code", "Lua:WS.Php.Sink.Cmd", "Lua:WS.Php.Sink.DynInclude", "Lua:WS.Php.Xform.Decode", "Lua:WS.Php.Xform.LitDecode", "Lua:WS.Php.Xform.CharLoop", "Lua:WS.Php.Indirect.VarCall", "Lua:WS.Php.Indirect.FuncProbe", "Lua:WS.Php.Indirect.HiddenSink", "Lua:WS.Php.Indirect.HiddenSinkMulti", "Lua:WS.Php.Flow.SrcToCode", "Lua:WS.Php.Flow.SrcToCmd", "Lua:WS.Php.Flow.SrcToInclude", "Lua:WS.Php.Flow.SrcToFile", "Lua:WS.Php.Flow.SrcToVarCall", "Lua:WS.Php.Flow.SrcToVarSink", "Lua:WS.Php.Flow.SrcToHiddenSink", "Lua:WS.Php.Flow.SrcCallee", "Lua:WS.Php.Flow.StageIncludeUnlink", "Lua:WS.Php.Flow.SrcStagedInclude", "Lua:WS.Php.Known.FamilyMarker"} do
    local l_0_14 = nil
    -- DECOMPILER ERROR at PC131: Confused about usage of register: R15 in 'UnsetPending'

    -- DECOMPILER ERROR at PC142: Confused about usage of register: R16 in 'UnsetPending'

    if l_0_7[(string.sub)(l_0_14["Lua:WS.Php.Gate.CustomHeader"], 12)] then
      (mp.set_mpattribute)(l_0_14["Lua:WS.Php.Gate.CustomHeader"])
    end
  end
  local l_0_19 = nil
  if type((mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))) == "string" then
    if (string.find)((mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)), "mu-plugins", 1, true) then
      (mp.set_mpattribute)("Lua:WS.Php.Ctx.MuPlugin")
    end
    if (string.find)((mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)), "wp-content", 1, true) or (string.find)((mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)), "wp-includes", 1, true) or (string.find)((mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)), "wp-admin", 1, true) then
      (mp.set_mpattribute)("Lua:WS.Php.Ctx.WpTree")
    end
    local l_0_20 = nil
    local l_0_21 = {php = true, php3 = true, php4 = true, php5 = true, php7 = true, php8 = true, phtml = true, pht = true, phar = true, inc = true}
    if (string.match)(l_0_20, "%.(%w+)$") == nil or not l_0_21[(string.match)(l_0_20, "%.(%w+)$")] then
      (mp.set_mpattribute)("Lua:WS.Php.Ctx.NoPhpExt")
    end
  end
  do
    do
      do return mp.CLEAN end
      -- DECOMPILER ERROR at PC232: freeLocal<0 in 'ReleaseLocals'

    end
  end
end

