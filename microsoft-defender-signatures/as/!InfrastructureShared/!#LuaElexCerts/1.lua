-- Threat: !InfrastructureShared
-- Name: !#Lua:ElexCerts
-- Type: 8

local l_0_0 = mp.GetCertificateInfo()
if l_0_0 == nil or #l_0_0 == 0 then
  return mp.CLEAN
end
for l_0_1, l_0_2 in ipairs(l_0_0) do
  if l_0_2.AuthenticodeContentType ~= "PE" then
    return mp.CLEAN
  end
  local l_0_3 = l_0_2.Certificates
  if l_0_3 ~= nil then
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      local l_0_6 = l_0_5.Subject
      if l_0_6 ~= nil and l_0_6.Organization ~= nil and l_0_6.CommonName then
        local l_0_7 = {
          ["Yuanyuan Mei"] = true,
          ["Tianjing Cheng"] = true,
          ["Ding Ruan"] = true,
          ["Xin Zhou"] = true,
          ["Yu Bao"] = true,
          ["Yuanyuan Zhang"] = true,
          ["Yupeng Zhang"] = true,
          ["Chao Wei"] = true,
          ["Beijing Caiyunshidai Technology Co., Ltd."] = true,
          ["BIG JOURNEY TECHNOLOGY LIMITED"] = true,
          ["VANKY TECHNOLOGY LIMITED"] = true
        }
        local l_0_8 = {
          ["Beijing Caiyunshidai Technology Co., Ltd."] = true,
          ["BIG JOURNEY TECHNOLOGY LIMITED"] = true,
          ["VANKY TECHNOLOGY LIMITED"] = true
        }
        local l_0_9 = {
          ["Wenchao Zhang"] = true,
          ["Junyan Li"] = true,
          ["Skytouch Technology Co., Limited"] = true,
          ["Beijing Xingyunwang Technology Co., Ltd"] = true,
          ["Hefei Infinity Technology Co., Ltd."] = true,
          ["Shanghai Yuntong Technology Co., Ltd."] = true,
          ["Xiaodong Wang"] = true,
          ["Jia Lu"] = true,
          ["Peng Zhang"] = true,
          ["Thinknice Co. Limited"] = true
        }
        local l_0_10 = {
          ["Skytouch Technology Co., Limited"] = true,
          ["Beijing Xingyunwang Technology Co., Ltd"] = true,
          ["Hefei Infinity Technology Co., Ltd."] = true,
          ["Shanghai Yuntong Technology Co., Ltd."] = true,
          ["Thinknice Co. Limited"] = true
        }
        local l_0_11 = {
          ["Nayun Online Network Technology (Shenzhen) Co., Ltd."] = true
        }
        local l_0_12 = {
          ["Jinnan Wu"] = true,
          ["Yang Liu"] = true,
          ["Chencheng Cai"] = true,
          ["Yanling Sun"] = true,
          ["Jianfei Zhu"] = true,
          ["Dening Hu"] = true,
          ["Nayun Online Network Technology (Shenzhen) Co., Ltd."] = true,
          ["Yuesong Pu"] = true
        }
        local l_0_13 = {
          ["EVANGEL TECHNOLOGY(HK) LIMITED"] = true
        }
        local l_0_14 = {
          ["Weiwei He"] = true,
          ["EVANGEL TECHNOLOGY(HK) LIMITED"] = true
        }
        local l_0_15 = {
          ["Sice Xing"] = true,
          ["Wei Liu"] = true,
          ["Shan Feng"] = true,
          ["Shulan Hou"] = true,
          ["Fuyuan Zhou"] = true,
          ["Luhong Han"] = true,
          ["Yongli Zhang"] = true,
          ["Jiang Liu"] = true,
          ["Yongli Li"] = true,
          ["Sivi Technology Limited"] = true,
          ["Zhiming Yuan"] = true
        }
        local l_0_16 = {
          ["Sivi Technology Limited"] = true
        }
        local l_0_17 = {
          ["Zhongju Wu"] = true,
          ["Houtao Zhou"] = true
        }
        local l_0_18 = mp.utf16to8(l_0_6.Organization)
        local l_0_19 = mp.utf16to8(l_0_6.CommonName)
        if l_0_18 == "No Organization Affiliation" then
          if l_0_7[l_0_19] then
            mp.set_mpattribute("Lua:ElexCertSasquor.A")
          elseif l_0_9[l_0_19] then
            mp.set_mpattribute("Lua:ElexCertSupTab.A")
          elseif l_0_12[l_0_19] then
            mp.set_mpattribute("Lua:ElexCertXadupi.A")
          elseif l_0_15[l_0_19] then
            mp.set_mpattribute("Lua:ElexCertGhokswa.A")
          elseif l_0_17[l_0_19] then
            mp.set_mpattribute("Lua:ElexCertSuweezy.A")
          elseif l_0_14[l_0_19] then
            mp.set_mpattribute("Lua:ElexCertChuckenit.A")
          end
        elseif l_0_8[l_0_18] then
          if l_0_7[l_0_19] then
            mp.set_mpattribute("Lua:ElexCertSasquor.A")
          end
        elseif l_0_10[l_0_18] then
          if l_0_9[l_0_19] then
            mp.set_mpattribute("Lua:ElexCertSupTab.A")
          end
        elseif l_0_13[l_0_18] then
          if l_0_14[l_0_19] then
            mp.set_mpattribute("Lua:ElexCertChuckenit.A")
          end
        elseif l_0_16[l_0_18] then
          if l_0_15[l_0_19] then
            mp.set_mpattribute("Lua:ElexCertGhokswa.A")
          end
        elseif l_0_11[l_0_18] and l_0_12[l_0_19] then
          mp.set_mpattribute("Lua:ElexCertXadupi.A")
        end
      end
    end
  end
end
return mp.CLEAN
