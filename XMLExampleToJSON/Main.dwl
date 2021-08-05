%dw 2.0
output application/json
import camelize, isNumeric from dw::core::Strings
---
(payload..Response[0] - "Status") mapObject {
    (camelize($$)): $ match {
        case x if !(x is String) -> x
        case x matches /^\d*\.\d\d$/ -> x[0] as Number
        else -> $
    }
}
