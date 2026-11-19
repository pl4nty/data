-- Threat: !InfrastructureShared
-- Name: 2e1b39e737813
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and l_0_0 ~= "" then
  local l_0_1 = {
    ".pdf",
    ".rtf",
    ".docx",
    ".doc",
    ".xls",
    ".xlsx",
    ".ppt",
    ".pptx"
  }
  local l_0_2 = 0
  if this_sigattrlog[13].matched and this_sigattrlog[13].utf8p1 ~= nil and this_sigattrlog[14].matched and this_sigattrlog[14].utf8p1 ~= nil then
    local l_0_3 = false
    local l_0_4 = this_sigattrlog[13].utf8p1
    local l_0_5 = this_sigattrlog[14].utf8p1
    for l_0_6, l_0_7 in ipairs(l_0_1) do
      if l_0_4:sub(-1 * #l_0_7) == l_0_7 then
        local l_0_8 = l_0_7 .. "."
        if string.find(l_0_5, l_0_8, 1, true) then
          l_0_3 = true
          l_0_2 = l_0_2 + 1
        end
      end
    end
    if l_0_3 == false then
      return mp.CLEAN
    end
  end
  if this_sigattrlog[15].matched and this_sigattrlog[15].utf8p1 ~= nil and this_sigattrlog[16].matched and this_sigattrlog[16].utf8p1 ~= nil then
    local l_0_9 = false
    local l_0_10 = this_sigattrlog[15].utf8p1
    local l_0_11 = this_sigattrlog[16].utf8p1
    for l_0_12, l_0_13 in ipairs(l_0_1) do
      if l_0_10:sub(-1 * #l_0_13) == l_0_13 then
        local l_0_14 = l_0_13 .. "."
        if string.find(l_0_11, l_0_14, 1, true) then
          l_0_9 = true
          l_0_2 = l_0_2 + 1
        end
      end
    end
    if l_0_9 == false then
      return mp.CLEAN
    end
  end
  if this_sigattrlog[17].matched and this_sigattrlog[17].utf8p1 ~= nil and this_sigattrlog[18].matched and this_sigattrlog[18].utf8p1 ~= nil then
    local l_0_15 = false
    local l_0_16 = this_sigattrlog[17].utf8p1
    local l_0_17 = this_sigattrlog[18].utf8p1
    for l_0_18, l_0_19 in ipairs(l_0_1) do
      if l_0_16:sub(-1 * #l_0_19) == l_0_19 then
        local l_0_20 = l_0_19 .. "."
        if string.find(l_0_17, l_0_20, 1, true) then
          l_0_15 = true
          l_0_2 = l_0_2 + 1
        end
      end
    end
    if l_0_15 == false then
      return mp.CLEAN
    end
  end
  if this_sigattrlog[19].matched and this_sigattrlog[19].utf8p1 ~= nil and this_sigattrlog[20].matched and this_sigattrlog[20].utf8p1 ~= nil then
    local l_0_21 = false
    local l_0_22 = this_sigattrlog[19].utf8p1
    local l_0_23 = this_sigattrlog[20].utf8p1
    for l_0_24, l_0_25 in ipairs(l_0_1) do
      if l_0_22:sub(-1 * #l_0_25) == l_0_25 then
        local l_0_26 = l_0_25 .. "."
        if string.find(l_0_23, l_0_26, 1, true) then
          l_0_21 = true
          l_0_2 = l_0_2 + 1
        end
      end
    end
    if l_0_21 == false then
      return mp.CLEAN
    end
  end
  if this_sigattrlog[21].matched and this_sigattrlog[21].utf8p1 ~= nil and this_sigattrlog[22].matched and this_sigattrlog[22].utf8p1 ~= nil then
    local l_0_27 = false
    local l_0_28 = this_sigattrlog[21].utf8p1
    local l_0_29 = this_sigattrlog[22].utf8p1
    for l_0_30, l_0_31 in ipairs(l_0_1) do
      if l_0_28:sub(-1 * #l_0_31) == l_0_31 then
        local l_0_32 = l_0_31 .. "."
        if string.find(l_0_29, l_0_32, 1, true) then
          l_0_27 = true
          l_0_2 = l_0_2 + 1
        end
      end
    end
    if l_0_27 == false then
      return mp.CLEAN
    end
  end
  if l_0_2 == 5 then
    addRelatedProcess()
    reportRelatedBmHits()
    bm.add_related_string("ImagePath", l_0_0, bm.RelatedStringBMReport)
    TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
    return mp.INFECTED
  end
end
return mp.CLEAN
