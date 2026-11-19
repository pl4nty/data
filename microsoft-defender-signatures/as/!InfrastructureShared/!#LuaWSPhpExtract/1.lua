-- Threat: !InfrastructureShared
-- Name: !#Lua:WS.Php.Extract
-- Type: 13
-- Includes: WebShellLib
-- MpAttributes: (RPF:TopLevelFile) & (BM_PHP_FILE | Lua:PHPExt | SCRIPT:HasPHPHeaderTag.A)

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or l_0_0 < 24 or 8388608 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = 196608
local l_0_2 = 65536
local l_0_3 = l_0_0
local l_0_4 = 0
if l_0_0 > l_0_1 + l_0_2 then
  l_0_3 = l_0_1
  l_0_4 = l_0_2
end
mp.readprotection(false)
local l_0_5 = mp.readfile(0, l_0_3)
local l_0_6
if 0 < l_0_4 then
  l_0_6 = mp.readfile(l_0_0 - l_0_4, l_0_4)
end
mp.readprotection(true)
if l_0_5 == nil then
  return mp.CLEAN
end
local l_0_7 = {}
local l_0_8 = false
local l_0_9 = false

local function l_0_10(l_1_0, l_1_1)
  local l_1_2 = string.lower(l_1_0)
  if not WsPhpPrefilter(l_1_2) then
    return
  end
  l_0_8 = true
  if WsPhpFamilyMarker(l_1_2) then
    l_0_7["Known.FamilyMarker"] = true
  end
  local l_1_3, l_1_4 = pcall(WsPhpExtract, l_1_0, l_1_1)
  if not l_1_3 or type(l_1_4) ~= "table" then
    l_0_9 = true
    return
  end
  for l_1_5 in pairs(l_1_4) do
    l_0_7[l_1_5] = true
  end
end

l_0_10(tostring(l_0_5), false)
if l_0_6 ~= nil then
  local l_0_11 = tostring(l_0_6)
  local l_0_12 = string.find(l_0_11, "\n", 1, true)
  if l_0_12 then
    l_0_11 = string.sub(l_0_11, l_0_12 + 1)
  end
  l_0_10(l_0_11, true)
end
if not l_0_8 then
  return mp.CLEAN
end
mp.set_mpattribute("Lua:WS.Php.Analyzed")
if l_0_9 then
  mp.set_mpattribute("Lua:WS.Php.Error")
end
local l_0_13 = {
  "Lua:WS.Php.Src.Request",
  "Lua:WS.Php.Src.ServerAlias",
  "Lua:WS.Php.Src.ServerDynKey",
  "Lua:WS.Php.Gate.CustomHeader",
  "Lua:WS.Php.Sink.Code",
  "Lua:WS.Php.Sink.Cmd",
  "Lua:WS.Php.Sink.DynInclude",
  "Lua:WS.Php.Xform.Decode",
  "Lua:WS.Php.Xform.LitDecode",
  "Lua:WS.Php.Xform.CharLoop",
  "Lua:WS.Php.Indirect.VarCall",
  "Lua:WS.Php.Indirect.FuncProbe",
  "Lua:WS.Php.Indirect.HiddenSink",
  "Lua:WS.Php.Indirect.HiddenSinkMulti",
  "Lua:WS.Php.Flow.SrcToCode",
  "Lua:WS.Php.Flow.SrcToCmd",
  "Lua:WS.Php.Flow.SrcToInclude",
  "Lua:WS.Php.Flow.SrcToFile",
  "Lua:WS.Php.Flow.SrcToVarCall",
  "Lua:WS.Php.Flow.SrcToVarSink",
  "Lua:WS.Php.Flow.SrcToHiddenSink",
  "Lua:WS.Php.Flow.SrcCallee",
  "Lua:WS.Php.Flow.StageIncludeUnlink",
  "Lua:WS.Php.Flow.SrcStagedInclude",
  "Lua:WS.Php.Known.FamilyMarker"
}
for l_0_14 = 1, #l_0_13 do
  local l_0_15 = l_0_13[l_0_14]
  if l_0_7[string.sub(l_0_15, 12)] then
    mp.set_mpattribute(l_0_15)
  end
end
local l_0_16 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if type(l_0_16) == "string" then
  if string.find(l_0_16, "mu-plugins", 1, true) then
    mp.set_mpattribute("Lua:WS.Php.Ctx.MuPlugin")
  end
  if string.find(l_0_16, "wp-content", 1, true) or string.find(l_0_16, "wp-includes", 1, true) or string.find(l_0_16, "wp-admin", 1, true) then
    mp.set_mpattribute("Lua:WS.Php.Ctx.WpTree")
  end
  local l_0_17 = {
    php = true,
    php3 = true,
    php4 = true,
    php5 = true,
    php7 = true,
    php8 = true,
    phtml = true,
    pht = true,
    phar = true,
    inc = true
  }
  local l_0_18 = string.match(l_0_16, "%.(%w+)$")
  if l_0_18 == nil or not l_0_17[l_0_18] then
    mp.set_mpattribute("Lua:WS.Php.Ctx.NoPhpExt")
  end
end
return mp.CLEAN
