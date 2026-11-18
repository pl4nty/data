-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/Doplik.EY
-- Type: 13
-- Includes: Path
-- MpAttributes: MpOnOpenOrCloseRtpScan & (Lua:DLLExt | Lua:EXEExt) & RPF:TopLevelFile & Lua:FileInsideAppDataRoamingFolder & Lua:TopLevelUnsigned & Lua:PeInternalNameDiffFromFileName & (HSTR:Viemlod.Frag | HSTR:CRC32_CONST_TABLE | HSTR:Win32/Obfuscator.Redundancy.bits.btr.A | HSTR:VirTool:Win32/Redundancy.LongJumpJNC.A)

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_FNAME), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 <= 1 then
  return mp.CLEAN
end
l_0_0 = normalize_path(l_0_0)
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_0:match("appdata\\roaming\\([^\\]+)$")
if l_0_2 ~= nil and l_0_2 == string.sub(l_0_1, 1, -5) then
  return mp.INFECTED
end
return mp.CLEAN
