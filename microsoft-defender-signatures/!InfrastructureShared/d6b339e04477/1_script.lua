-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d6b339e04477\1_luac 

-- params : ...
-- function num : 0
local l_0_15 = nil
local l_0_16 = nil
do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7, l_0_9, l_0_11, l_0_13 = 0, 0
  end
  if not l_0_15 then
    return mp.CLEAN
  end
  if l_0_15 == "" then
    return mp.CLEAN
  end
  if not StringStartsWith(l_0_15, ".") then
    return mp.CLEAN
  end
  if (string.len)(l_0_15) < 4 or IsExtensionDatePattern(l_0_15) == true or (string.match)(l_0_15, "%d+.%d+.%d+") or (string.match)(l_0_15, "%.%w+%.%w+$") then
    return mp.CLEAN
  end
  if (mp.bitand)((mp.GetExtensionClass)(l_0_15), 3) ~= 0 then
    return mp.CLEAN
  end
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 then
    l_0_16 = (this_sigattrlog[3]).utf8p2
    local l_0_8, l_0_10, l_0_12, l_0_14 = nil
  else
    do
      if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 then
        l_0_16 = (this_sigattrlog[4]).utf8p2
      end
      if not l_0_16 then
        return mp.CLEAN
      end
      local l_0_17 = nil
      if not safeJsonDeserialize(l_0_16) then
        return mp.CLEAN
      end
      local l_0_18 = nil
      local l_0_19 = nil
      if isnull((safeJsonDeserialize(l_0_16)).file_list) then
        return mp.CLEAN
      end
      local l_0_20 = {[".7z"] = true, [".accdb"] = true, [".accde"] = true, [".avi"] = true, [".bmp"] = true, [".cmd"] = true, [".csv"] = true, [".dbf"] = true, [".doc"] = true, [".docb"] = true, [".docm"] = true, [".docx"] = true, [".dot"] = true, [".dotm"] = true, [".dotx"] = true, [".dwg"] = true, [".dws"] = true, [".dxf"] = true, [".email"] = true, [".eml"] = true, [".gif"] = true, [".gpg"] = true, [".gz"] = true, [".hsf"] = true, [".htm"] = true, [".html"] = true, [".igs"] = true, [".jpg"] = true, [".jpeg"] = true, [".json"] = true, [".kdb"] = true, [".kdbx"] = true, [".lnk"] = true, [".mdb"] = true, [".mp3"] = true, [".mp4"] = true, [".mpeg"] = true, [".mpg"] = true, [".msg"] = true, [".ost"] = true, [".png"] = true, [".pdf"] = true, [".pgp"] = true, [".pos"] = true, [".potm"] = true, [".potx"] = true, [".ppam"] = true, [".pps"] = true, [".ppsx"] = true, [".ppt"] = true, [".pptm"] = true, [".pptx"] = true, [".pst"] = true, [".rar"] = true, [".shp"] = true, [".shx"] = true, [".skp"] = true, [".sql"] = true, [".tlg"] = true, [".tsv"] = true, [".txt"] = true, [".vcf"] = true, [".vsd"] = true, [".vsdm"] = true, [".xlam"] = true, [".xlm"] = true, [".xls"] = true, [".xlsb"] = true, [".xlsm"] = true, [".xlsx"] = true, [".xlt"] = true, [".xltm"] = true, [".xltx"] = true, [".xlw"] = true, [".xml"] = true, [".yaml"] = true, [".yml"] = true, [".zip"] = true, [".exe"] = true}
      -- DECOMPILER ERROR at PC206: Confused about usage of register: R6 in 'UnsetPending'

      for l_0_24 = 1, #(safeJsonDeserialize(l_0_16)).file_list do
        local l_0_21, l_0_22 = , {}
        -- DECOMPILER ERROR at PC209: Confused about usage of register: R11 in 'UnsetPending'

        -- DECOMPILER ERROR at PC215: Confused about usage of register: R11 in 'UnsetPending'

        if l_0_11 % 2 == 0 then
          (table.insert)(l_0_22, l_0_21[l_0_11])
        end
      end
      -- DECOMPILER ERROR at PC219: Confused about usage of register: R7 in 'UnsetPending'

      for l_0_28,l_0_29 in pairs(l_0_22) do
        local l_0_25, l_0_26 = nil
        -- DECOMPILER ERROR at PC223: Confused about usage of register: R12 in 'UnsetPending'

        if StringStartsWith(table.insert, "\\\\") then
          l_0_18 = l_0_18 + 1
        end
        -- DECOMPILER ERROR at PC231: Confused about usage of register: R12 in 'UnsetPending'

        if l_0_20[(string.lower)((table.insert):match("(%.[^.]+)$"))] then
          l_0_17 = l_0_17 + 1
        end
      end
      if l_0_18 >= 3 then
        (bm.trigger_sig)("GenRansom_SD_RemotePath", safeJsonSerialize(l_0_19))
      end
      if l_0_17 >= 3 then
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

