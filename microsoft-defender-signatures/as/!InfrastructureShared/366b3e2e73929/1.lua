-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\366b3e2e73929\1.luac 

-- params : ...
-- function num : 0
local l_0_4 = nil
local l_0_5 = nil
local l_0_6 = nil
do
  if (this_sigattrlog[18]).matched and (this_sigattrlog[18]).utf8p2 then
    local l_0_0, l_0_1, l_0_2, l_0_3 = 0, 0
  end
  if not l_0_5 then
    return mp.CLEAN
  end
  if l_0_5 == "" then
    return mp.CLEAN
  end
  if not StringStartsWith(l_0_5, ".") then
    return mp.CLEAN
  end
  local l_0_7 = nil
  if contains(l_0_5, {".tmp", ".temp", ".rename", ".nm!", ".bin", ".~mt", ".~tmp"}) then
    return mp.CLEAN
  end
  if (string.match)(l_0_5, "%.d+$") then
    return mp.CLEAN
  end
  if (string.len)(l_0_5) < 4 or IsExtensionDatePattern(l_0_5) == true or (string.match)(l_0_5, "%d+.%d+.%d+") or (string.match)(l_0_5, "%.%w+%.%w+$") then
    return mp.CLEAN
  end
  if (mp.bitand)((mp.GetExtensionClass)(l_0_5), 3) ~= 0 then
    return mp.CLEAN
  end
  if (this_sigattrlog[19]).matched and (this_sigattrlog[19]).utf8p2 then
    l_0_6 = (this_sigattrlog[19]).utf8p2
  else
    if (this_sigattrlog[20]).matched and (this_sigattrlog[20]).utf8p2 then
      l_0_6 = (this_sigattrlog[20]).utf8p2
    end
  end
  if not l_0_6 then
    return mp.CLEAN
  end
  local l_0_8 = nil
  if not safeJsonDeserialize(l_0_6) then
    return mp.CLEAN
  end
  local l_0_9 = nil
  local l_0_10 = nil
  if isnull((safeJsonDeserialize(l_0_6)).file_list) then
    return mp.CLEAN
  end
  local l_0_11 = {[".7z"] = true, [".accdb"] = true, [".accde"] = true, [".avi"] = true, [".bmp"] = true, [".cmd"] = true, [".csv"] = true, [".dbf"] = true, [".doc"] = true, [".docb"] = true, [".docm"] = true, [".docx"] = true, [".dot"] = true, [".dotm"] = true, [".dotx"] = true, [".dwg"] = true, [".dws"] = true, [".dxf"] = true, [".email"] = true, [".eml"] = true, [".gif"] = true, [".gpg"] = true, [".gz"] = true, [".hsf"] = true, [".htm"] = true, [".html"] = true, [".igs"] = true, [".jpg"] = true, [".jpeg"] = true, [".json"] = true, [".kdb"] = true, [".kdbx"] = true, [".lnk"] = true, [".mdb"] = true, [".mp3"] = true, [".mp4"] = true, [".mpeg"] = true, [".mpg"] = true, [".msg"] = true, [".ost"] = true, [".png"] = true, [".pdf"] = true, [".pgp"] = true, [".pos"] = true, [".potm"] = true, [".potx"] = true, [".ppam"] = true, [".pps"] = true, [".ppsx"] = true, [".ppt"] = true, [".pptm"] = true, [".pptx"] = true, [".pst"] = true, [".rar"] = true, [".shp"] = true, [".shx"] = true, [".skp"] = true, [".sql"] = true, [".tlg"] = true, [".tsv"] = true, [".txt"] = true, [".vcf"] = true, [".vsd"] = true, [".vsdm"] = true, [".xlam"] = true, [".xlm"] = true, [".xls"] = true, [".xlsb"] = true, [".xlsm"] = true, [".xlsx"] = true, [".xlt"] = true, [".xltm"] = true, [".xltx"] = true, [".xlw"] = true, [".xml"] = true, [".yaml"] = true, [".yml"] = true, [".zip"] = true, [".exe"] = true}
  -- DECOMPILER ERROR at PC234: Confused about usage of register: R7 in 'UnsetPending'

  for l_0_15 = 1, #(safeJsonDeserialize(l_0_6)).file_list do
    local l_0_12, l_0_13 = , {}
    -- DECOMPILER ERROR at PC237: Confused about usage of register: R12 in 'UnsetPending'

    if R12_PC237 % 2 == 0 then
      (table.insert)(l_0_13, l_0_12[R12_PC237])
    end
  end
  -- DECOMPILER ERROR at PC247: Confused about usage of register: R8 in 'UnsetPending'

  for l_0_19,l_0_20 in pairs(l_0_13) do
    local l_0_16, l_0_17 = nil
    -- DECOMPILER ERROR at PC251: Confused about usage of register: R13 in 'UnsetPending'

    if StringStartsWith(table.insert, "\\\\") then
      l_0_8 = l_0_8 + 1
    end
    -- DECOMPILER ERROR at PC259: Confused about usage of register: R13 in 'UnsetPending'

    if l_0_11[(string.lower)((table.insert):match("(%.[^.]+)$"))] then
      l_0_7 = l_0_7 + 1
    end
  end
  if l_0_8 >= 5 then
    (bm.trigger_sig)("GenRansom_SD_RemotePath", safeJsonSerialize(l_0_10))
  end
  if l_0_7 >= 5 then
    (bm.set_detection_string)(safeJsonSerialize(l_0_10))
    return mp.INFECTED
  end
  return mp.CLEAN
end

