-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFWin32INETShortcutUrlToAssemblyA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = (MpCommon.PathToWin32Path)(l_0_1)
if isnull(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if isnull(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = (mp.getfilesize)()
if l_0_4 > 1024000 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_5 = tostring((mp.readfile)(0, l_0_4))
;
(mp.readprotection)(true)
local l_0_6 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = (string.lower)(l_1_0)
  if (string.match)(l_1_1, "^%s*(.-)%s*$") or not (string.match)(l_1_1, "^\"(.-)\"$") then
    l_1_1 = (string.gsub)(l_1_1, "%%(%x%x)", function(l_2_0)
    -- function num : 0_0_0
    local l_2_1 = string.char
    do
      local l_2_2, l_2_3, l_2_4 = tonumber(l_2_0, 16), .end
      do return l_2_1(l_2_2, l_2_3, l_2_4) end
      -- DECOMPILER ERROR at PC8: Confused about usage of register R2 for local variables in 'ReleaseLocals'

    end
  end
)
    local l_1_2 = (string.match)(l_1_1, "^file:///(.+)$")
    if isnull(l_1_2) then
      l_1_2 = (string.match)(l_1_1, "^file://localhost/(.+)$")
    end
    if isnull(l_1_2) then
      l_1_2 = (string.match)(l_1_1, "^file://(.+)$")
    end
    if isnull(l_1_2) then
      l_1_2 = (string.match)(l_1_1, "^file:\"(.-)\"$")
    end
    if isnull(l_1_2) then
      l_1_2 = (string.match)(l_1_1, "^([a-z]:[/\\].+)$")
    end
    if isnull(l_1_2) then
      return nil
    end
    local l_1_3 = string.gsub
    local l_1_4 = l_1_2
    local l_1_5 = "/"
    do
      local l_1_6 = "\\"
      do return l_1_3(l_1_4, l_1_5, l_1_6) end
      -- DECOMPILER ERROR at PC88: Confused about usage of register R4 for local variables in 'ReleaseLocals'

    end
  end
end

local l_0_7 = (string.match)(l_0_5, "[Uu][Rr][Ll]=([^\r\n]+)")
if isnull(l_0_7) then
  return mp.CLEAN
end
local l_0_8 = l_0_6(l_0_7)
if isnull(l_0_8) then
  return mp.CLEAN
end
local l_0_9 = (MpCommon.PathToWin32Path)(l_0_8)
if isnull(l_0_9) then
  return mp.CLEAN
end
local l_0_10 = "INETShortcutUrlToAssembly"
;
(MpCommon.BmTriggerSig)(l_0_3, (string.format)("%s!%s", l_0_10, l_0_2), l_0_9)
local l_0_11 = {}
l_0_11.url_filepath = l_0_2
l_0_11.exe_filepath = l_0_9
local l_0_12 = safeJsonSerialize(l_0_11)
;
(mp.SetDetectionString)(l_0_12)
return mp.INFECTED

