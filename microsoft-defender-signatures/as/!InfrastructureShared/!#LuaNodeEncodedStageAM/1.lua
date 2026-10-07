-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaNodeEncodedStageAM\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if isnull(l_0_0) or type(l_0_0) ~= "string" then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0)
if (string.sub)(l_0_1, -3) ~= ".js" and (string.sub)(l_0_1, -4) ~= ".mjs" and (string.sub)(l_0_1, -4) ~= ".cjs" then
  return mp.CLEAN
end
local l_0_2 = (mp.getfilesize)()
if isnull(l_0_2) or type(l_0_2) ~= "number" or l_0_2 ~= l_0_2 or l_0_2 < 128 or l_0_2 > 1048576 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_3, l_0_4 = pcall(mp.readfile, 0, l_0_2)
;
(mp.readprotection)(true)
if not l_0_3 or isnull(l_0_4) or type(l_0_4) ~= "string" or #l_0_4 ~= l_0_2 then
  set_research_data("SC_NodeStage_Error", "IncompleteFileRead", false)
  return mp.CLEAN
end
l_0_4 = (string.lower)(l_0_4)
local l_0_5 = function(l_1_0, l_1_1)
  -- function num : 0_0
  for l_1_5,l_1_6 in ipairs(l_1_1) do
    if (string.find)(l_1_0, l_1_6, 1, true) then
      return true
    end
  end
  return false
end

local l_0_6 = l_0_5
local l_0_7 = l_0_4
local l_0_8 = {}
-- DECOMPILER ERROR at PC117: No list found for R8 , SetList fails

-- DECOMPILER ERROR at PC121: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC124: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC125: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC126: Overwrote pending register: R11 in 'AssignReg'

if l_0_6 then
  l_0_6, l_0_8 = l_0_6(l_0_7, l_0_8), {"node:vm", "\'vm\'", "\"vm\""}
end
if not l_0_6 then
  l_0_6 = mp
  l_0_6 = l_0_6.CLEAN
  return l_0_6
end
l_0_6 = l_0_5
-- DECOMPILER ERROR at PC135: Overwrote pending register: R7 in 'AssignReg'

l_0_6, l_0_8 = l_0_6(l_0_7, l_0_8), {"brotlidecompresssync", "gunzipsync", "inflatesync", "inflaterawsync", "unzipsync"}
if not l_0_6 then
  l_0_6 = mp
  l_0_6 = l_0_6.CLEAN
  return l_0_6
end
l_0_6 = l_0_5
-- DECOMPILER ERROR at PC150: Overwrote pending register: R7 in 'AssignReg'

l_0_6, l_0_8 = l_0_6(l_0_7, l_0_8), {"\'base64\'", "\"base64\"", "\'base64url\'", "\"base64url\""}
if l_0_6 then
  l_0_6 = string
  l_0_6 = l_0_6.find
  -- DECOMPILER ERROR at PC162: Overwrote pending register: R7 in 'AssignReg'

  l_0_8 = "buffer"
  l_0_6 = l_0_6(l_0_7, l_0_8, 1, true)
end
if not l_0_6 then
  l_0_6 = mp
  l_0_6 = l_0_6.CLEAN
  return l_0_6
end
l_0_6 = l_0_5
-- DECOMPILER ERROR at PC173: Overwrote pending register: R7 in 'AssignReg'

l_0_6, l_0_8 = l_0_6(l_0_7, l_0_8), {"runinnewcontext", "runincontext", "runinthiscontext"}
if not l_0_6 then
  l_0_6 = mp
  l_0_6 = l_0_6.CLEAN
  return l_0_6
end
l_0_6 = string
l_0_6 = l_0_6.find
-- DECOMPILER ERROR at PC187: Overwrote pending register: R7 in 'AssignReg'

l_0_8 = "require"
l_0_6 = l_0_6(l_0_7, l_0_8, 1, true)
if l_0_6 then
  l_0_6 = string
  l_0_6 = l_0_6.find
  -- DECOMPILER ERROR at PC196: Overwrote pending register: R7 in 'AssignReg'

  l_0_8 = "process"
  l_0_6 = l_0_6(l_0_7, l_0_8, 1, true)
  if l_0_6 then
    l_0_6 = l_0_5
    -- DECOMPILER ERROR at PC204: Overwrote pending register: R7 in 'AssignReg'

    l_0_6, l_0_8 = l_0_6(l_0_7, l_0_8), {"fetch", "node:https", "\'https\'", "\"https\"", "node:http", "\'http\'", "\"http\""}
  end
end
if not l_0_6 then
  l_0_6 = mp
  l_0_6 = l_0_6.CLEAN
  return l_0_6
end
l_0_6 = mp
l_0_6 = l_0_6.INFECTED
return l_0_6

