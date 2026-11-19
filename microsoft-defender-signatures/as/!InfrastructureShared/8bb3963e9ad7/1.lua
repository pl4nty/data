-- Threat: !InfrastructureShared
-- Name: 8bb3963e9ad7
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[2].matched == false then
  return mp.CLEAN
end
if this_sigattrlog[3].matched == false then
  return mp.CLEAN
end
if this_sigattrlog[4].matched == false then
  return mp.CLEAN
end
if this_sigattrlog[5].matched == false then
  return mp.CLEAN
end
if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p1
  if l_0_0 == nil and 4 >= string.len(l_0_0) then
    return mp.CLEAN
  end
  local l_0_1 = this_sigattrlog[1].utf8p2
  if l_0_1 == nil and 4 >= string.len(l_0_1) then
    return mp.CLEAN
  end
  local l_0_2 = {
    ["winword.exe"] = true,
    ["excel.exe"] = true,
    ["powerpnt.exe"] = true
  }
  local l_0_3 = string.lower(string.match(l_0_0, "([^\\]-[^\\%.]+)$"))
  if l_0_3 == nil and 4 >= string.len(l_0_3) then
    return mp.CLEAN
  end
  if l_0_2[l_0_3] then
    local l_0_4 = this_sigattrlog[1].ppid
    local l_0_5 = this_sigattrlog[2].ppid
    if l_0_4 ~= l_0_5 then
      return mp.CLEAN
    end
    local l_0_6, l_0_7 = bm.get_process_relationships(l_0_4)
    if #l_0_7 ~= 3 then
      return mp.CLEAN
    end
    local l_0_8 = false
    local l_0_9 = false
    local l_0_10 = false
    local l_0_11 = {
      ["\\wscript.exe"] = true,
      ["\\cscript.exe"] = true
    }
    for l_0_12, l_0_13 in ipairs(l_0_7) do
      local l_0_14 = l_0_13.image_path
      local l_0_15 = mp.bitand(l_0_13.reason_ex, 1)
      if string.len(l_0_14) > 8 and string.sub(l_0_14, -8) == "\\cmd.exe" and l_0_15 == 1 then
        l_0_8 = true
      end
      if string.len(l_0_14) > 12 and l_0_11[string.sub(l_0_14, -12)] and l_0_15 ~= 1 then
        l_0_9 = true
      end
      if string.len(l_0_14) > 15 and string.sub(l_0_14, -15) == "\\powershell.exe" and l_0_15 ~= 1 then
        l_0_10 = true
      end
    end
    if l_0_8 == false or l_0_9 == false or l_0_10 == false then
      return mp.CLEAN
    end
    local l_0_16 = this_sigattrlog[4].ppid
    local l_0_17 = this_sigattrlog[5].ppid
    local l_0_18, l_0_19 = bm.get_process_relationships(l_0_16)
    if #l_0_19 ~= 1 then
      return mp.CLEAN
    end
    if l_0_19[1].ppid ~= l_0_17 then
      return mp.CLEAN
    end
    local l_0_20 = {
      [".xls"] = true,
      [".doc"] = true,
      [".ppt"] = true,
      [".pps"] = true,
      docx = true,
      pptx = true,
      ppsx = true,
      xlsx = true,
      [".rtf"] = true,
      [".xml"] = true,
      dotx = true,
      dotm = true,
      [".odt"] = true,
      xlsb = true,
      xltx = true,
      xltm = true,
      xlam = true,
      [".xla"] = true,
      docm = true,
      xlsm = true,
      pptm = true
    }
    bm_AddRelatedFileFromCommandLine(l_0_1, l_0_20)
    local l_0_21 = {
      [".js"] = true,
      vbs = true,
      wsf = true,
      jse = true,
      vbe = true
    }
    local l_0_22 = this_sigattrlog[3].utf8p2
    bm_AddRelatedFileFromCommandLine(l_0_22, l_0_21, 3)
    return mp.INFECTED
  end
end
return mp.CLEAN
