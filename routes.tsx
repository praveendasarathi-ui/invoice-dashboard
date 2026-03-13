import { createBrowserRouter } from "react-router-dom";
import RootBoundary from "./components/errors/RootBoundary";
import ErrorBoundaryLayout from "./components/errors/ErrorBoundaryLayout";
import { Layout } from "./components/Layout";
import Dashboard from "./pages/Dashboard";
import Clients from "./pages/Clients";
import Invoices from "./pages/Invoices";
import InvoiceCreate from "./pages/InvoiceCreate";
import InvoiceEdit from "./pages/InvoiceEdit";
import InvoiceDetail from "./pages/InvoiceDetail";
import Settings from "./pages/Settings";
import NotFound from "./pages/NotFound";

import AuthPage from "./pages/Auth";
import ProtectedRoute from "./components/ProtectedRoute";

export const router = createBrowserRouter([
  {
    errorElement: <RootBoundary />,
    children: [
      {
        path: "/auth",
        element: <AuthPage />,
      },
      {
        element: <ProtectedRoute />,
        children: [
          {
            path: "/",
            element: (
              <Layout>
                <Dashboard />
              </Layout>
            ),
            errorElement: <ErrorBoundaryLayout />,
          },
          {
            path: "/clients",
            element: (
              <Layout>
                <Clients />
              </Layout>
            ),
            errorElement: <ErrorBoundaryLayout />,
          },
          {
            path: "/invoices",
            element: (
              <Layout>
                <Invoices />
              </Layout>
            ),
            errorElement: <ErrorBoundaryLayout />,
          },
          {
            path: "/invoices/new",
            element: (
              <Layout>
                <InvoiceCreate />
              </Layout>
            ),
            errorElement: <ErrorBoundaryLayout />,
          },
          {
            path: "/invoices/:id/edit",
            element: (
              <Layout>
                <InvoiceEdit />
              </Layout>
            ),
            errorElement: <ErrorBoundaryLayout />,
          },
          {
            path: "/invoices/:id",
            element: (
              <Layout>
                <InvoiceDetail />
              </Layout>
            ),
            errorElement: <ErrorBoundaryLayout />,
          },
          {
            path: "/settings",
            element: (
              <Layout>
                <Settings />
              </Layout>
            ),
            errorElement: <ErrorBoundaryLayout />,
          },
        ],
      },
      {
        path: "*",
        element: <NotFound />,
      },
    ],
  },
]);