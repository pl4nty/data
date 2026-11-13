-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\14eb34c5427b3\1.luac 

-- params : ...
-- function num : 0
if (bm.GetSignatureMatchDuration)() > 100000000 then
  return mp.CLEAN
end
local l_0_0 = (bm.get_imagepath)()
if l_0_0 ~= nil and l_0_0 ~= "" and IsExcludedByImagePath(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (bm.get_current_process_startup_info)()
if l_0_1 ~= nil and l_0_1.ppid ~= nil and isParentPackageManager(l_0_1.ppid, true) then
  return mp.CLEAN
end
local l_0_2 = 5
local l_0_3 = 16384
local l_0_4 = 16389
local l_0_5 = {}
l_0_5.txt = true
l_0_5.js = true
l_0_5.pptx = true
l_0_5.ppt = true
l_0_5.doc = true
l_0_5.docx = true
l_0_5.xlsx = true
l_0_5.xls = true
l_0_5["7z"] = true
l_0_5.zip = true
l_0_5.tar = true
l_0_5.gz = true
l_0_5.rar = true
l_0_5.pdf = true
l_0_5.png = true
l_0_5.jpg = true
l_0_5.pst = true
l_0_5.ost = true
l_0_5.html = true
l_0_5.htm = true
l_0_5.py = true
l_0_5.sh = true
l_0_5.pl = true
l_0_5.php = true
local l_0_6 = {}
;
(function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_5, l_0_6, l_0_3, l_0_4
  if l_1_0 == nil or not l_1_0.matched then
    return 
  end
  local l_1_1 = l_1_0.attribute
  local l_1_2 = l_1_0.utf8p1
  if type(l_1_2) ~= "string" or l_1_2 == "" then
    return 
  end
  local l_1_3 = (string.match)(l_1_2, "([^/]+)$")
  if l_1_3 == nil then
    return 
  end
  local l_1_4, l_1_5, l_1_6 = (string.match)(l_1_3, "^(.+)%.([^%.]+)%.([^%.]+)$")
  if l_1_4 == nil or l_1_6 == nil then
    return 
  end
  if not l_0_5[(string.lower)(l_1_5)] then
    return 
  end
  do
    if l_0_6[l_1_2] == nil then
      local l_1_7, l_1_8, l_1_9 = {}
      l_1_8 = l_0_6
      l_1_8[l_1_2] = l_1_7
    end
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R7 in 'UnsetPending'

    -- DECOMPILER ERROR at PC54: Confused about usage of register: R7 in 'UnsetPending'

    if l_1_1 == l_0_3 then
      l_1_7.created = true
    else
      -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

      if l_1_1 == l_0_4 then
        l_1_7.unknown = true
      end
    end
  end
end
)(this_sigattrlog[1])
-- DECOMPILER ERROR at PC78: Confused about usage of register: R7 in 'UnsetPending'

;
(function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_5, l_0_6, l_0_3, l_0_4
  if l_1_0 == nil or not l_1_0.matched then
    return 
  end
  local l_1_1 = l_1_0.attribute
  local l_1_2 = l_1_0.utf8p1
  if type(l_1_2) ~= "string" or l_1_2 == "" then
    return 
  end
  local l_1_3 = (string.match)(l_1_2, "([^/]+)$")
  if l_1_3 == nil then
    return 
  end
  local l_1_4, l_1_5, l_1_6 = (string.match)(l_1_3, "^(.+)%.([^%.]+)%.([^%.]+)$")
  if l_1_4 == nil or l_1_6 == nil then
    return 
  end
  if not l_0_5[(string.lower)(l_1_5)] then
    return 
  end
  do
    if l_0_6[l_1_2] == nil then
      local l_1_7, l_1_8, l_1_9 = {}
      l_1_8 = l_0_6
      l_1_8[l_1_2] = l_1_7
    end
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R7 in 'UnsetPending'

    -- DECOMPILER ERROR at PC54: Confused about usage of register: R7 in 'UnsetPending'

    if l_1_1 == l_0_3 then
      l_1_7.created = true
    else
      -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

      if l_1_1 == l_0_4 then
        l_1_7.unknown = true
      end
    end
  end
end
)(this_sigattrlog[2])
-- DECOMPILER ERROR at PC82: Confused about usage of register: R7 in 'UnsetPending'

;
(function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_5, l_0_6, l_0_3, l_0_4
  if l_1_0 == nil or not l_1_0.matched then
    return 
  end
  local l_1_1 = l_1_0.attribute
  local l_1_2 = l_1_0.utf8p1
  if type(l_1_2) ~= "string" or l_1_2 == "" then
    return 
  end
  local l_1_3 = (string.match)(l_1_2, "([^/]+)$")
  if l_1_3 == nil then
    return 
  end
  local l_1_4, l_1_5, l_1_6 = (string.match)(l_1_3, "^(.+)%.([^%.]+)%.([^%.]+)$")
  if l_1_4 == nil or l_1_6 == nil then
    return 
  end
  if not l_0_5[(string.lower)(l_1_5)] then
    return 
  end
  do
    if l_0_6[l_1_2] == nil then
      local l_1_7, l_1_8, l_1_9 = {}
      l_1_8 = l_0_6
      l_1_8[l_1_2] = l_1_7
    end
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R7 in 'UnsetPending'

    -- DECOMPILER ERROR at PC54: Confused about usage of register: R7 in 'UnsetPending'

    if l_1_1 == l_0_3 then
      l_1_7.created = true
    else
      -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

      if l_1_1 == l_0_4 then
        l_1_7.unknown = true
      end
    end
  end
end
)(this_sigattrlog[3])
-- DECOMPILER ERROR at PC86: Confused about usage of register: R7 in 'UnsetPending'

;
(function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_5, l_0_6, l_0_3, l_0_4
  if l_1_0 == nil or not l_1_0.matched then
    return 
  end
  local l_1_1 = l_1_0.attribute
  local l_1_2 = l_1_0.utf8p1
  if type(l_1_2) ~= "string" or l_1_2 == "" then
    return 
  end
  local l_1_3 = (string.match)(l_1_2, "([^/]+)$")
  if l_1_3 == nil then
    return 
  end
  local l_1_4, l_1_5, l_1_6 = (string.match)(l_1_3, "^(.+)%.([^%.]+)%.([^%.]+)$")
  if l_1_4 == nil or l_1_6 == nil then
    return 
  end
  if not l_0_5[(string.lower)(l_1_5)] then
    return 
  end
  do
    if l_0_6[l_1_2] == nil then
      local l_1_7, l_1_8, l_1_9 = {}
      l_1_8 = l_0_6
      l_1_8[l_1_2] = l_1_7
    end
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R7 in 'UnsetPending'

    -- DECOMPILER ERROR at PC54: Confused about usage of register: R7 in 'UnsetPending'

    if l_1_1 == l_0_3 then
      l_1_7.created = true
    else
      -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

      if l_1_1 == l_0_4 then
        l_1_7.unknown = true
      end
    end
  end
end
)(this_sigattrlog[4])
-- DECOMPILER ERROR at PC90: Confused about usage of register: R7 in 'UnsetPending'

;
(function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_5, l_0_6, l_0_3, l_0_4
  if l_1_0 == nil or not l_1_0.matched then
    return 
  end
  local l_1_1 = l_1_0.attribute
  local l_1_2 = l_1_0.utf8p1
  if type(l_1_2) ~= "string" or l_1_2 == "" then
    return 
  end
  local l_1_3 = (string.match)(l_1_2, "([^/]+)$")
  if l_1_3 == nil then
    return 
  end
  local l_1_4, l_1_5, l_1_6 = (string.match)(l_1_3, "^(.+)%.([^%.]+)%.([^%.]+)$")
  if l_1_4 == nil or l_1_6 == nil then
    return 
  end
  if not l_0_5[(string.lower)(l_1_5)] then
    return 
  end
  do
    if l_0_6[l_1_2] == nil then
      local l_1_7, l_1_8, l_1_9 = {}
      l_1_8 = l_0_6
      l_1_8[l_1_2] = l_1_7
    end
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R7 in 'UnsetPending'

    -- DECOMPILER ERROR at PC54: Confused about usage of register: R7 in 'UnsetPending'

    if l_1_1 == l_0_3 then
      l_1_7.created = true
    else
      -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

      if l_1_1 == l_0_4 then
        l_1_7.unknown = true
      end
    end
  end
end
)(this_sigattrlog[5])
-- DECOMPILER ERROR at PC94: Confused about usage of register: R7 in 'UnsetPending'

;
(function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_5, l_0_6, l_0_3, l_0_4
  if l_1_0 == nil or not l_1_0.matched then
    return 
  end
  local l_1_1 = l_1_0.attribute
  local l_1_2 = l_1_0.utf8p1
  if type(l_1_2) ~= "string" or l_1_2 == "" then
    return 
  end
  local l_1_3 = (string.match)(l_1_2, "([^/]+)$")
  if l_1_3 == nil then
    return 
  end
  local l_1_4, l_1_5, l_1_6 = (string.match)(l_1_3, "^(.+)%.([^%.]+)%.([^%.]+)$")
  if l_1_4 == nil or l_1_6 == nil then
    return 
  end
  if not l_0_5[(string.lower)(l_1_5)] then
    return 
  end
  do
    if l_0_6[l_1_2] == nil then
      local l_1_7, l_1_8, l_1_9 = {}
      l_1_8 = l_0_6
      l_1_8[l_1_2] = l_1_7
    end
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R7 in 'UnsetPending'

    -- DECOMPILER ERROR at PC54: Confused about usage of register: R7 in 'UnsetPending'

    if l_1_1 == l_0_3 then
      l_1_7.created = true
    else
      -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

      if l_1_1 == l_0_4 then
        l_1_7.unknown = true
      end
    end
  end
end
)(this_sigattrlog[6])
-- DECOMPILER ERROR at PC98: Confused about usage of register: R7 in 'UnsetPending'

;
(function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_5, l_0_6, l_0_3, l_0_4
  if l_1_0 == nil or not l_1_0.matched then
    return 
  end
  local l_1_1 = l_1_0.attribute
  local l_1_2 = l_1_0.utf8p1
  if type(l_1_2) ~= "string" or l_1_2 == "" then
    return 
  end
  local l_1_3 = (string.match)(l_1_2, "([^/]+)$")
  if l_1_3 == nil then
    return 
  end
  local l_1_4, l_1_5, l_1_6 = (string.match)(l_1_3, "^(.+)%.([^%.]+)%.([^%.]+)$")
  if l_1_4 == nil or l_1_6 == nil then
    return 
  end
  if not l_0_5[(string.lower)(l_1_5)] then
    return 
  end
  do
    if l_0_6[l_1_2] == nil then
      local l_1_7, l_1_8, l_1_9 = {}
      l_1_8 = l_0_6
      l_1_8[l_1_2] = l_1_7
    end
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R7 in 'UnsetPending'

    -- DECOMPILER ERROR at PC54: Confused about usage of register: R7 in 'UnsetPending'

    if l_1_1 == l_0_3 then
      l_1_7.created = true
    else
      -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

      if l_1_1 == l_0_4 then
        l_1_7.unknown = true
      end
    end
  end
end
)(this_sigattrlog[7])
-- DECOMPILER ERROR at PC102: Confused about usage of register: R7 in 'UnsetPending'

;
(function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_5, l_0_6, l_0_3, l_0_4
  if l_1_0 == nil or not l_1_0.matched then
    return 
  end
  local l_1_1 = l_1_0.attribute
  local l_1_2 = l_1_0.utf8p1
  if type(l_1_2) ~= "string" or l_1_2 == "" then
    return 
  end
  local l_1_3 = (string.match)(l_1_2, "([^/]+)$")
  if l_1_3 == nil then
    return 
  end
  local l_1_4, l_1_5, l_1_6 = (string.match)(l_1_3, "^(.+)%.([^%.]+)%.([^%.]+)$")
  if l_1_4 == nil or l_1_6 == nil then
    return 
  end
  if not l_0_5[(string.lower)(l_1_5)] then
    return 
  end
  do
    if l_0_6[l_1_2] == nil then
      local l_1_7, l_1_8, l_1_9 = {}
      l_1_8 = l_0_6
      l_1_8[l_1_2] = l_1_7
    end
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R7 in 'UnsetPending'

    -- DECOMPILER ERROR at PC54: Confused about usage of register: R7 in 'UnsetPending'

    if l_1_1 == l_0_3 then
      l_1_7.created = true
    else
      -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

      if l_1_1 == l_0_4 then
        l_1_7.unknown = true
      end
    end
  end
end
)(this_sigattrlog[8])
-- DECOMPILER ERROR at PC106: Confused about usage of register: R7 in 'UnsetPending'

;
(function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_5, l_0_6, l_0_3, l_0_4
  if l_1_0 == nil or not l_1_0.matched then
    return 
  end
  local l_1_1 = l_1_0.attribute
  local l_1_2 = l_1_0.utf8p1
  if type(l_1_2) ~= "string" or l_1_2 == "" then
    return 
  end
  local l_1_3 = (string.match)(l_1_2, "([^/]+)$")
  if l_1_3 == nil then
    return 
  end
  local l_1_4, l_1_5, l_1_6 = (string.match)(l_1_3, "^(.+)%.([^%.]+)%.([^%.]+)$")
  if l_1_4 == nil or l_1_6 == nil then
    return 
  end
  if not l_0_5[(string.lower)(l_1_5)] then
    return 
  end
  do
    if l_0_6[l_1_2] == nil then
      local l_1_7, l_1_8, l_1_9 = {}
      l_1_8 = l_0_6
      l_1_8[l_1_2] = l_1_7
    end
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R7 in 'UnsetPending'

    -- DECOMPILER ERROR at PC54: Confused about usage of register: R7 in 'UnsetPending'

    if l_1_1 == l_0_3 then
      l_1_7.created = true
    else
      -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

      if l_1_1 == l_0_4 then
        l_1_7.unknown = true
      end
    end
  end
end
)(this_sigattrlog[9])
-- DECOMPILER ERROR at PC110: Confused about usage of register: R7 in 'UnsetPending'

;
(function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_5, l_0_6, l_0_3, l_0_4
  if l_1_0 == nil or not l_1_0.matched then
    return 
  end
  local l_1_1 = l_1_0.attribute
  local l_1_2 = l_1_0.utf8p1
  if type(l_1_2) ~= "string" or l_1_2 == "" then
    return 
  end
  local l_1_3 = (string.match)(l_1_2, "([^/]+)$")
  if l_1_3 == nil then
    return 
  end
  local l_1_4, l_1_5, l_1_6 = (string.match)(l_1_3, "^(.+)%.([^%.]+)%.([^%.]+)$")
  if l_1_4 == nil or l_1_6 == nil then
    return 
  end
  if not l_0_5[(string.lower)(l_1_5)] then
    return 
  end
  do
    if l_0_6[l_1_2] == nil then
      local l_1_7, l_1_8, l_1_9 = {}
      l_1_8 = l_0_6
      l_1_8[l_1_2] = l_1_7
    end
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R7 in 'UnsetPending'

    -- DECOMPILER ERROR at PC54: Confused about usage of register: R7 in 'UnsetPending'

    if l_1_1 == l_0_3 then
      l_1_7.created = true
    else
      -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

      if l_1_1 == l_0_4 then
        l_1_7.unknown = true
      end
    end
  end
end
)(this_sigattrlog[10])
if next(l_0_6) == nil then
  return mp.CLEAN
end
do
  local l_0_8 = nil
  for l_0_12,l_0_13 in pairs(l_0_6) do
    local l_0_9 = 0
    -- DECOMPILER ERROR at PC127: Confused about usage of register: R13 in 'UnsetPending'

    if R13_PC127.created and R13_PC127.unknown then
      l_0_9 = l_0_9 + 1
    end
  end
  -- DECOMPILER ERROR at PC136: Confused about usage of register: R8 in 'UnsetPending'

  if l_0_9 < l_0_2 then
    return mp.CLEAN
  end
  addRelatedProcess()
  reportRelatedBmHits()
  ;
  (bm.add_related_string)("ImagePath", l_0_0, bm.RelatedStringBMReport)
  TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC160: freeLocal<0 in 'ReleaseLocals'

end

