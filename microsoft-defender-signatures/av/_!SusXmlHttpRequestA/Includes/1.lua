-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!SusXmlHttpRequestA\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = tostring(headerpage)
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = tostring(footerpage)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = l_0_0 .. l_0_1
if isnull(l_0_2) then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
local l_0_3 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = {}
  for l_1_5 in (string.gmatch)(l_1_0, "http[s]?://[^\"%s]+") do
    (table.insert)(l_1_1, l_1_5)
  end
  return l_1_1
end

local l_0_4 = l_0_3(l_0_2)
l_0_4 = table_dedup(l_0_4)
local l_0_5 = {}
l_0_5.SIG_CONTEXT = "AMSI"
l_0_5.CONTENT_SOURCE = "LUAGENERIC_DEVIL_AMSI"
l_0_5.PROCESS_CONTEXT = "wscript_or_cscript"
l_0_5.FILELESS = "true"
l_0_5.CMDLINE_URL = "true"
for l_0_9,l_0_10 in ipairs(l_0_4) do
  if (string.match)(l_0_10, "^https?://") then
    local l_0_11, l_0_12 = (mp.CheckUrl)(l_0_10)
    if l_0_11 == 1 and l_0_12 == 1 then
      return mp.CLEAN
    end
    local l_0_13 = SafeGetUrlReputation
    local l_0_14 = {}
    -- DECOMPILER ERROR at PC77: No list found for R14 , SetList fails

    -- DECOMPILER ERROR at PC78: Overwrote pending register: R15 in 'AssignReg'

    l_0_13 = l_0_13(l_0_14, l_0_10, false, 3000)
    l_0_14 = l_0_13.urls
    l_0_14 = l_0_14[l_0_10]
    if l_0_14 then
      l_0_14 = l_0_13.urls
      l_0_14 = l_0_14[l_0_10]
      l_0_14 = l_0_14.determination
      if l_0_14 ~= 2 then
        l_0_14 = l_0_13.urls
        l_0_14 = l_0_14[l_0_10]
        l_0_14 = l_0_14.determination
      end
      if l_0_14 == 3 then
        l_0_14 = l_0_13.urls
        l_0_14 = l_0_14[l_0_10]
        l_0_14 = l_0_14.confidence
        if l_0_14 >= 60 then
          l_0_14 = mp
          l_0_14 = l_0_14.INFECTED
          return l_0_14
        end
      end
    end
  end
end
return mp.CLEAN

