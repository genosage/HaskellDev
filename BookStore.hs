type CustomerID = Int
type Address = [String]

data BookInfo = Book Int String [String]
    deriving(Show)

data Customer = Customer {
    customerID :: CustomerID,
    customerName :: String,
    customerAddress :: Address
    }deriving (Show)