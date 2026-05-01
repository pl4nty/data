-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7cb3d36b701f\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[1]).utf8p2
if type(l_0_0) ~= "string" or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = function(l_1_0)
  -- function num : 0_0
  if type(l_1_0) ~= "string" then
    return ""
  end
  local l_1_1 = string.lower
  local l_1_2 = l_1_0
  do return l_1_1(l_1_2) end
  -- DECOMPILER ERROR at PC12: Confused about usage of register R2 for local variables in 'ReleaseLocals'

end

local l_0_2 = function(l_2_0)
  -- function num : 0_1
  if type(l_2_0) ~= "string" then
    return ""
  end
  return (l_2_0:gsub("^%s+", "")):gsub("%s+$", "")
end

local l_0_3 = function(l_3_0)
  -- function num : 0_2
  if type(l_3_0) ~= "string" then
    return nil
  end
  local l_3_1 = l_3_0:match("/tr%s+\"\\\\\"([^\"]+)\\\\\"\"")
  if l_3_1 and l_3_1 ~= "" then
    return l_3_1
  end
  l_3_1 = l_3_0:match("/tr%s+\"([^\"]+)\"")
  if l_3_1 and l_3_1 ~= "" then
    return l_3_1
  end
  l_3_1 = l_3_0:match("/tr%s+([^%s]+)")
  if l_3_1 and l_3_1 ~= "" then
    return l_3_1
  end
  return nil
end

local l_0_4 = function(l_4_0)
  -- function num : 0_3
  if type(l_4_0) ~= "string" then
    return nil
  end
  local l_4_1, l_4_2 = l_4_0:match, l_4_0
  do
    local l_4_3 = "([^\\]+)$"
    do return l_4_1(l_4_2, l_4_3) end
    -- DECOMPILER ERROR at PC11: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

local l_0_5 = function(l_5_0)
  -- function num : 0_4
  local l_5_1 = (MpCommon.GetOriginalFileName)(l_5_0)
  if l_5_1 and l_5_1 ~= "" then
    return l_5_1
  end
  local l_5_2 = (sysio.GetPEVersionInfo)(l_5_0)
  if l_5_2 and l_5_2.OriginalFilename and l_5_2.OriginalFilename ~= "" then
    return l_5_2.OriginalFilename
  end
  return nil
end

local l_0_6 = l_0_1(l_0_0)
local l_0_7 = l_0_3(l_0_6)
if not l_0_7 then
  return mp.CLEAN
end
l_0_7 = l_0_2(l_0_7)
l_0_7 = l_0_7:gsub("^\"(.*)\"$", "%1")
l_0_7 = l_0_7:gsub("^\\\"(.*)\\\"$", "%1")
if not (MpCommon.PathToWin32Path)(l_0_7) then
  local l_0_8 = l_0_1(l_0_7)
  local l_0_9 = l_0_4(l_0_7)
  if not l_0_9 or l_0_9 == "" then
    return mp.CLEAN
  end
  if not (string.find)(l_0_8, "\\users\\", 1, true) then
    return mp.CLEAN
  end
  if not (string.find)(l_0_8, "\\appdata\\", 1, true) then
    return mp.CLEAN
  end
  if not l_0_9:match("%.exe$") then
    return mp.CLEAN
  end
  if not (sysio.IsFileExists)(l_0_7) then
    (bm.add_related_string)("TargetMissing", l_0_7, bm.RelatedStringBMReport)
    return mp.CLEAN
  end
  local l_0_10 = l_0_5(l_0_7)
  if not l_0_10 or l_0_10 == "" then
    return mp.CLEAN
  end
  local l_0_11 = (l_0_1(l_0_9)):gsub("\"", "")
  local l_0_12 = (((l_0_1(l_0_10)):gsub("\"", "")):gsub("%s+$", "")):gsub("%z+$", "")
  if l_0_11 ~= l_0_12 then
    (bm.add_related_string)("Target", l_0_7, bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("FileName", l_0_9, bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("OriginalFileName", l_0_10, bm.RelatedStringBMReport)
    ;
    (bm.add_related_file)(l_0_7)
    return mp.INFECTED
  end
  return mp.CLEAN
end

