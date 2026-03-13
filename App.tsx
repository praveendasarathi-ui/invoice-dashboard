import { RouterProvider } from "react-router-dom";
import { Toaster } from "sonner";
import "./index.css";
import { router } from "./routes";

import { AuthProvider } from "./lib/AuthContext";

const App = () => {
  return (
    <AuthProvider>
      <div className="min-h-screen">
        <RouterProvider router={router} />
        <Toaster position="top-right" richColors />
      </div>
    </AuthProvider>
  );
};

export default App;