   
   func isRestrictIPAddressCharacters(string: String) -> Bool {
        if string.count == 1 && string == "."{
            return false
        }
        let exp = "^(\\d{1,3})?([\\.](\\d{1,3})?)?([\\.](\\d{1,3})?)?([\\.](\\d{1,3})?)?$"
        let regu = try? NSRegularExpression(pattern: exp, options: .caseInsensitive)
        let noofmatch: Int? = regu?.numberOfMatches(in: string, options: [], range: NSRange(location: 0, length: string.count))
        if noofmatch == 0 {
            if (string == "") {
                return true
            }
            return false
        }
        
        var characterArray = Array(string)
        if characterArray.count > 2, characterArray[characterArray.count-2] == characterArray.last, characterArray.last == "." {
            return false
        }
        
        var stringArray = string.components(separatedBy: ".")
        stringArray = stringArray.filter { $0 != "" }
        let newArray = stringArray.filter{Int($0)! < 256}
        if stringArray.count == newArray.count{
            return true
        }
        return false
    }
