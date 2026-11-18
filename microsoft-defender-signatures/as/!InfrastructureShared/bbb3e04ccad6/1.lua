-- Threat: !InfrastructureShared
-- Name: bbb3e04ccad6
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
else
  return mp.CLEAN
end

local function l_0_1(l_1_0)
  local l_1_1 = {}
  for l_1_2 in string.gmatch(l_1_0, "[^%s]+") do
    table.insert(l_1_1, l_1_2)
  end
  local l_1_3
  for l_1_4 = 1, #l_1_1 do
    if l_1_1[l_1_4] == "/xml" then
      if l_1_1[l_1_4 + 1] ~= nil then
        l_1_3 = l_1_1[l_1_4 + 1]
        l_1_3 = string.gsub(l_1_3, "^%s*(.-)%s*$", "%1")
        l_1_3 = string.gsub(l_1_3, "^['\"]*(.-)['\"]*$", "%1")
      end
      break
    end
  end
  return l_1_3
end

local l_0_2 = l_0_1(l_0_0)
local l_0_3 = {
  "\\users\\.+",
  "\\device\\cdrom.+",
  "\\device\\mup\\.+"
}
for l_0_4, l_0_5 in ipairs(l_0_3) do
  if string.find(l_0_2, l_0_5) then
    local function l_0_6(l_2_0)
      local l_2_1 = {}
      
      local l_2_2 = {}
      local l_2_3 = false
      l_2_0 = l_2_0:gsub("<!%-%-(.-)%-%->", "")
      l_2_0 = l_2_0:gsub("<%?(.-)%?>", "")
      l_2_0:gsub("<([/!]?)([%a_][%w-:_]*)%s*(/?>?)([^<]*)", function(l_3_0, l_3_1, l_3_2, l_3_3)
        if #l_3_0 == 0 then
          local l_3_4 = {}
          if #l_3_2 == 0 then
            local l_3_5 = 0
            for l_3_6, l_3_7, l_3_8, l_3_9, l_3_10 in string.gmatch(l_3_3, "(([%a_][%w-:_]*)%s*=%s*(['\"])(.-)%3%s*(/?>?))") do
              l_3_5 = l_3_5 + #l_3_6
              l_3_4[l_3_7] = l_3_9
              if #l_3_10 ~= 0 then
                if l_3_10 == "/>" then
                  l_3_3 = ""
                elseif l_3_10 == ">" then
                  l_3_3 = l_3_3:sub(l_3_5 + 1)
                else
                  error("invalid tag")
                end
                l_3_2 = l_3_10
              end
            end
          end
          table.insert(l_2_1, l_3_1)
          if not l_2_3 and l_3_1 == "Command" then
            l_2_3 = true
          end
          if l_2_3 and l_3_3 ~= "" then
            table.insert(l_2_2, l_3_3)
          end
          if not next(l_3_4) then
            l_3_4 = nil
          end
          if l_3_2:byte(1) == string.byte("/") then
            table.remove(l_2_1)
          end
        elseif l_3_0 == "/" then
          if l_2_1[#l_2_1] == l_3_1 then
            table.remove(l_2_1)
          else
            error("invalid XML: mismatch closing tag")
          end
          if l_2_3 and l_3_1 == "Command" then
            l_2_3 = false
          end
        elseif l_3_0 == "!" then
          error("unsupported tag type")
        else
          error("parsing error")
        end
      end)
      return l_2_2
    end
    
    local l_0_7 = sysio.GetFileSize(l_0_2)
    if 50000 < l_0_7 then
      return mp.CLEAN
    end
    local l_0_8 = tostring(sysio.ReadFile(l_0_2, 0, l_0_7))
    local l_0_9 = l_0_6(l_0_8)
    
    local function l_0_10(l_4_0)
      local l_4_1 = {}
      for l_4_2 in string.gmatch(l_4_0, "http[s]?://[^\"%s]+") do
        table.insert(l_4_1, l_4_2)
      end
      return l_4_1
    end
    
    for l_0_11, l_0_12 in ipairs(l_0_9) do
      local l_0_13 = l_0_10(l_0_12)
      for l_0_14, l_0_15 in ipairs(l_0_13) do
        if string.match(l_0_15, "^https?://") then
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
